import 'package:bloc/bloc.dart';
import 'package:e_commerce/src/features/authentication/model/email_formz.dart';
import 'package:e_commerce/src/features/authentication/model/name_formz.dart';
import 'package:e_commerce/src/features/authentication/model/password_formz.dart';
import 'package:e_commerce/src/network/domain_manager.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  DomainManager get domain => DomainManager();

  SignupBloc() : super(SignupState()) {
    on<SignupNameChanged>(_onNameChanged);
    on<SignupPasswordChanged>(_onPasswordChanged);
    on<SignupEmailChanged>(_onEmailChanged);
    on<SignupSumitted>(_onSubmited);
  }

  void _onNameChanged(SignupNameChanged event, Emitter<SignupState> emit) {
    final name = NameFormzInput.dirty(event.name);
    emit(state.copyWith(name: name));
  }

  void _onPasswordChanged(
      SignupPasswordChanged event, Emitter<SignupState> emit) {
    final password = PasswordFormzInput.dirty(event.password);
    emit(state.copyWith(password: password));
  }

  void _onEmailChanged(SignupEmailChanged event, Emitter<SignupState> emit) {
    final email = EmailFormzInput.dirty(event.email);
    emit(state.copyWith(email: email));
  }

  void _onSubmited(SignupSumitted event, Emitter<SignupState> emit) async {
    if (state.status.isInProgress) return;
    if (state.isValidated == false) return;

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    if (state.isValidated) {
      final email = state.email.value;
      final password = state.password.value;
      final name = state.name.value;
      final result = await domain.sign
          .signUpWithEmail(email: email, password: password, name: name);
      if (result.isSuccess) {
        emit(state.copyWith(status: FormzSubmissionStatus.success));
      } else {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}
