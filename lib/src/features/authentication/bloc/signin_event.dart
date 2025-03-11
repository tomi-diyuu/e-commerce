part of 'signin_bloc.dart';

sealed class SigninEvent extends Equatable {
  const SigninEvent();

  @override
  List<Object> get props => [];
}

final class SigninEmailChanged extends SigninEvent {
  const SigninEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

final class SigninPasswordChanged extends SigninEvent {
  const SigninPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

final class SigninWithEmail extends SigninEvent {
  const SigninWithEmail();
}

final class SigninWithGoogle extends SigninEvent {
  const SigninWithGoogle();
}
