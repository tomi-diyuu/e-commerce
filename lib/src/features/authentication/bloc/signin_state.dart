part of 'signin_bloc.dart';

final class SigninState extends Equatable {
  const SigninState({
    this.email = const EmailFormzInput.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.password = const PasswordFormzInput.pure(),
  });

  final FormzSubmissionStatus status;
  final EmailFormzInput email;
  final PasswordFormzInput password;

  @override
  List<Object> get props => [email, password, status];

  bool get isValidated {
    return Formz.validate([email, password]);
  }

  SigninState copyWith({
    FormzSubmissionStatus? status,
    EmailFormzInput? email,
    PasswordFormzInput? password,
  }) {
    return SigninState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
