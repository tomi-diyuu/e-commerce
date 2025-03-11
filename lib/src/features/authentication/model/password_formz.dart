import 'package:e_commerce/src/features/authentication/model/form_error.dart';
import 'package:flutter/widgets.dart';
import 'package:formz/formz.dart';

class PasswordFormzInput extends FormzInput<String, FormError> {
  const PasswordFormzInput.pure() : super.pure('');
  const PasswordFormzInput.dirty([super.value = '']) : super.dirty();

  @override
  FormError? validator(String value) {
    if (value.isEmpty) return FormError.empty;
    if (value.length < 6) return FormError.invalid;
    return null;
  }

  String? errorOf(BuildContext context) {
    if (isPure) {
      return null;
    }

    switch (error) {
      case FormError.empty:
        return "Empty";
      case FormError.invalid:
        return "Password must be less than 6 characters";
      default:
        return null;
    }
  }
}
