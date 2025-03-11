import 'package:e_commerce/generated/assets/fonts.gen.dart';
import 'package:e_commerce/src/themes/app_bar_theme.dart';
import 'package:e_commerce/src/themes/elevated_button_theme.dart';
import 'package:e_commerce/src/themes/navigation_bar_theme.dart';
import 'package:e_commerce/src/themes/outlined_button_theme.dart';
import 'package:e_commerce/src/themes/text_button_theme.dart';
import 'package:e_commerce/src/themes/text_field_theme.dart';
import 'package:e_commerce/src/themes/text_theme.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  static const String? fontFamily = null;

  static ThemeData light() => ThemeData(
        fontFamily: FontFamily.metropolis,
        scaffoldBackgroundColor: AppColors.background,

        /// dialog
        dialogTheme: DialogTheme(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),

        /// Colors
        primaryColor: AppColors.primary,
        brightness: Brightness.light,

        /// Text
        textTheme: XTextTheme.lightTextTheme,

        /// ColorScheme
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
        ),

        // Appbar
        appBarTheme: XAppBarTheme.lightAppBarTheme,

        /// input
        inputDecorationTheme: XTextFieldTheme.lightInputDecorationTheme,

        // navigation bar
        navigationBarTheme: XNavigationBarTheme.lightNavigationBarTheme,

        /// Button
        buttonTheme: const ButtonThemeData(),
        elevatedButtonTheme: XElevatedButtonTheme.lightElevatedButtonTheme,
        outlinedButtonTheme: XOutlinedButtonTheme.lightOutlinedButtonTheme,
        textButtonTheme: XTextButtonTheme.lightTextButton,
        iconTheme: const IconThemeData(),
      );

  // do not support dark theme yet
  static ThemeData dark() => light();
}
