import 'package:e_commerce/src/features/cart/cubit/cart_cubit.dart';
import 'package:e_commerce/src/network/model/social_type.dart';
import 'package:e_commerce/src/network/model/social_user/social_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/src/features/account/bloc/account_bloc.dart';
import 'package:e_commerce/src/features/authentication/model/email_formz.dart';
import 'package:e_commerce/src/features/authentication/model/password_formz.dart';
import 'package:e_commerce/src/network/domain_manager.dart';
import 'package:e_commerce/src/network/model/common/result.dart';
import 'package:e_commerce/src/network/model/user/user.dart';
import 'package:e_commerce/src/router/coordinator.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:get_it/get_it.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(SigninState()) {
    on<SigninEmailChanged>(_onEmailChanged);
    on<SigninPasswordChanged>(_onPasswordChanged);
    on<SigninWithEmail>(_onSigninWithEmail);
    on<SigninWithGoogle>(_onSigninWithGoogle);
  }

  final domain = DomainManager();

  void _onEmailChanged(SigninEmailChanged event, Emitter<SigninState> emit) {
    final email = EmailFormzInput.dirty(event.email);
    emit(
      state.copyWith(email: email),
    );
  }

  void _onPasswordChanged(
      SigninPasswordChanged event, Emitter<SigninState> emit) {
    final password = PasswordFormzInput.dirty(event.password);
    emit(state.copyWith(
      password: password,
    ));
  }

  void _onSigninWithEmail(
      SigninWithEmail event, Emitter<SigninState> emit) async {
    if (state.isValidated) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

      final email = state.email.value;
      final password = state.password.value;

      final result =
          await domain.sign.loginWithEmail(email: email, password: password);
      return loginDecision(result);
    }
  }

  void _onSigninWithGoogle(
      SigninWithGoogle event, Emitter<SigninState> emit) async {
    if (state.status.isInProgress) return;
    emit(state.copyWith(
      status: FormzSubmissionStatus.inProgress,
    ));
    final result = await domain.sign.loginWithGoogle();
    return loginSocialDecision(result, MSocialType.google);
  }

  Future loginDecision(MResult<MUser> result) async {
    if (result.isSuccess) {
      emit(state.copyWith(status: FormzSubmissionStatus.success));
      GetIt.I<AccountBloc>().add(AccountLoggedIn(user: result.data!));
      AppCoordinator.pop();
    } else {
      print(result.error);
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }

  Future loginSocialDecision(
      MResult<MSocialUser> result, MSocialType socialType) async {
    if (result.isSuccess) {
      final data = result.data!;
      if (socialType == MSocialType.google) {
        connectBEWithGoogle(data);
      } else if (socialType == MSocialType.facebook) {
        // connectBEWithFacebook(data);
      } else if (socialType == MSocialType.apple) {
        // connectBEWithApple(data);
      }
    } else {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      // XAlert.show(title: "Error", body: result.error);
    }
  }

  Future connectBEWithGoogle(MSocialUser user) async {
    final result = await domain.sign.connectBEWithGoogle(user);
    return loginDecision(result);
  }
}
