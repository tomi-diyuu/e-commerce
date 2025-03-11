// ignore_for_file: deprecated_member_use

import 'package:e_commerce/src/themes/colors.dart';
import 'package:flutter/material.dart';

class XOutlinedButtonTheme {
  XOutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      textStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
    ).copyWith(
      side: WidgetStateProperty.resolveWith<BorderSide>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return BorderSide(
                color: AppColors.black.withOpacity(0.9), width: 1);
          }
          return const BorderSide(color: AppColors.black, width: 1);
        },
      ),
      foregroundColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.black.withOpacity(0.9);
          }
          return AppColors.black;
        },
      ),
    ),
  );
}
