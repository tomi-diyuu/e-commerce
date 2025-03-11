import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'form_error.dart';

class EmailFormzInput extends FormzInput<String, FormError> {
  const EmailFormzInput.pure([super.value = '']) : super.pure();
  const EmailFormzInput.dirty([super.value = '']) : super.dirty();

  static final RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  FormError? validator(String? value) {
    if ((value ?? '').isEmpty) {
      return FormError.empty;
    }
    return emailRegExp.hasMatch(value ?? '') ? null : FormError.invalid;
  }

  String? errorOf(BuildContext context) {
    if (isPure) {
      return null;
    }

    switch (error) {
      case FormError.empty:
        return "Empty";
      case FormError.invalid:
        return "Invalid email";
      default:
        return null;
    }
  }
}
