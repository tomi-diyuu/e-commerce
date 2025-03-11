import 'package:e_commerce/src/themes/colors.dart';
import 'package:flutter/material.dart';

class XNavigationBarTheme {
  static NavigationBarThemeData lightNavigationBarTheme =
      NavigationBarThemeData(
    indicatorColor: Colors.transparent,
    overlayColor: WidgetStateProperty.all(Colors.transparent),
    labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return const TextStyle(
              color: AppColors.primary, fontWeight: FontWeight.w500, fontSize: 10);
        }
        return const TextStyle(
            color: AppColors.gray, fontWeight: FontWeight.w500, fontSize: 10);
      },
    ),
  );
}
