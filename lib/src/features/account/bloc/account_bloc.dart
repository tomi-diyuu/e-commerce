// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:e_commerce/src/network/domain_manager.dart';
import 'package:e_commerce/src/network/model/user/user.dart';
import 'package:e_commerce/src/services/user_prefs.dart';
import 'package:equatable/equatable.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(AccountState.ds()) {
    on<AccountSubcriptionRequested>(_onSucriptionRequested);
    on<AccountLoggedIn>(_onLoggedIn);
    on<AccountLogout>(_onLoggedOut);
    on<AccountAvatarChanged>(_onAvatarChanged);
    on<ToggleFavoriteProduct>(_onToggleFavorite);
  }
  final _domain = DomainManager();
  Future _onSucriptionRequested(
      AccountSubcriptionRequested event, Emitter<AccountState> emit) async {
    String id = state.user.id;

    if (id.isNotEmpty) {
      final result = await _domain.user.getUser(id);

      if (result.isSuccess) {
        emit(state.copyWith(user: result.data));
      } else {
        emit(state.logout());
      }
    }
  }

  void _onLoggedIn(AccountLoggedIn event, Emitter<AccountState> emit) {
    _onUserChanged(state.login(event.user));
  }

  void _onLoggedOut(AccountLogout event, Emitter<AccountState> emit) async {
    await _domain.sign.logout();
    _onUserChanged(state.logout());
  }

  void _onAvatarChanged(
      AccountAvatarChanged event, Emitter<AccountState> emit) async {
    final result = await _domain.upload.uploadFile(event.avatar);
    final updatedUser = state.user.copyWith(avatar: result.url);
    await _domain.user.updateUser(updatedUser);
    _onUserChanged(state.copyWith(user: updatedUser));
  }

  void _onToggleFavorite(
      ToggleFavoriteProduct event, Emitter<AccountState> emit) async {
    final updatedFavorites = Set<String>.from(state.user.favorites);

    if (updatedFavorites.contains(event.productId)) {
      updatedFavorites.remove(event.productId);
    } else {
      updatedFavorites.add(event.productId);
    }

    final updatedUser =
        state.user.copyWith(favorites: updatedFavorites.toList());

    // Cập nhật trên Firestore
    await _domain.user.updateUser(updatedUser);

    // Cập nhật state
    _onUserChanged(state.copyWith(user: updatedUser));
  }

  void _onUserChanged(AccountState newState) {
    UserPrefs.instance.setUser(newState.user);
    emit(newState);
  }
}
