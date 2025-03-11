import 'package:e_commerce/src/themes/colors.dart';
import 'package:flutter/material.dart';

class XTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: AppColors.black,
        height: 1),
    headlineMedium: const TextStyle().copyWith(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: AppColors.black,
        height: 1),
    headlineSmall: const TextStyle().copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: AppColors.black,
        height: 1),
    titleLarge: const TextStyle().copyWith(
        fontSize: 22, fontWeight: FontWeight.w600, color: AppColors.black),
    titleMedium: const TextStyle().copyWith(
        fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.black),
    titleSmall: const TextStyle().copyWith(
        fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.black),
    bodyLarge: const TextStyle().copyWith(
        fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.black),
    bodyMedium: const TextStyle().copyWith(
        fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.black),
    bodySmall: const TextStyle().copyWith(
        fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.black),
    labelLarge: const TextStyle().copyWith(
        fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.gray),
    labelMedium: const TextStyle().copyWith(
        fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.gray),
    labelSmall: const TextStyle().copyWith(
        fontSize: 11, fontWeight: FontWeight.w400, color: AppColors.gray),
  );
}
