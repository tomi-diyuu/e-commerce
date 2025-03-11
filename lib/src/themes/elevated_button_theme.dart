// ignore_for_file: deprecated_member_use

import 'package:e_commerce/src/themes/colors.dart';
import 'package:flutter/material.dart';

class XElevatedButtonTheme {
  XElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: AppColors.primary,
          disabledForegroundColor: AppColors.white,
          disabledBackgroundColor: AppColors.primary.withOpacity(0.9),
          side: BorderSide.none,
          textStyle: const TextStyle(
              fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))));
}
