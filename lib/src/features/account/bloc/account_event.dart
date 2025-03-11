part of 'account_bloc.dart';

sealed class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

final class AccountSubcriptionRequested extends AccountEvent {
  const AccountSubcriptionRequested();
}

final class AccountLoggedIn extends AccountEvent {
  const AccountLoggedIn({required this.user});

  final MUser user;

  @override
  List<Object> get props => [user];
}

final class AccountLogout extends AccountEvent {
  const AccountLogout();

  @override
  List<Object> get props => [];
}

final class AccountAvatarChanged extends AccountEvent {
  const AccountAvatarChanged(this.avatar);

  final String avatar;

  @override
  List<Object> get props => [avatar];
}

class ToggleFavoriteProduct extends AccountEvent {
  final String productId;
  const ToggleFavoriteProduct({required this.productId});

  @override
  List<Object> get props => [productId];
}
