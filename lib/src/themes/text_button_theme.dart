import 'package:e_commerce/src/themes/colors.dart';
import 'package:flutter/material.dart';

class XTextButtonTheme {
  static final lightTextButton = TextButtonThemeData(
      style: TextButton.styleFrom(
          iconColor: AppColors.primary,
          foregroundColor: AppColors.black,
          textStyle: const TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.w500,
              fontSize: 14)));
}
