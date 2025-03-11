import 'package:e_commerce/src/features/authentication/model/form_error.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

class NameFormzInput extends FormzInput<String, FormError> {
  const NameFormzInput.pure() : super.pure('');
  const NameFormzInput.dirty([super.value = '']) : super.dirty();

  @override
  FormError? validator(String? value) {
    if ((value ?? '').isEmpty) {
      return FormError.empty;
    }
    return null;
  }

  String? errorOf(BuildContext context) {
    if (isPure) {
      return null;
    }
    switch (error) {
      case FormError.empty:
        return 'Empty';
      default:
        return null;
    }
  }
}
