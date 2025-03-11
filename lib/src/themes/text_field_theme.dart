import 'package:e_commerce/src/themes/colors.dart';
import 'package:flutter/material.dart';

class XTextFieldTheme {
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    prefixIconColor: AppColors.black,
    suffixIconColor: AppColors.black,
    hintStyle: const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.black),
    labelStyle: const TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.black),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    filled: true,
    fillColor: AppColors.white,
    errorStyle: const TextStyle(fontSize: 14, letterSpacing: 0.25),
  );
}
