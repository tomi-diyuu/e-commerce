part of 'signup_bloc.dart';

final class SignupState extends Equatable {
  const SignupState(
      {this.email = const EmailFormzInput.pure(),
      this.name = const NameFormzInput.pure(),
      this.password = const PasswordFormzInput.pure(),
      this.status = FormzSubmissionStatus.initial});

  final FormzSubmissionStatus status;
  final EmailFormzInput email;
  final PasswordFormzInput password;
  final NameFormzInput name;

  @override
  List<Object> get props => [status, email, password, name];

  bool get isValidated {
    return Formz.validate([email, password, name]);
  }

  SignupState copyWith({
    FormzSubmissionStatus? status,
    EmailFormzInput? email,
    PasswordFormzInput? password,
    NameFormzInput? name,
  }) {
    return SignupState(
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      status: status ?? this.status,
    );
  }
}
