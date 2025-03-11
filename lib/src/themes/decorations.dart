import 'package:e_commerce/src/themes/colors.dart';
import 'package:flutter/material.dart';

class AppDecorations {
  static final shadow = BoxShadow(
    offset: const Offset(0, 1),
    blurRadius: 8,
    spreadRadius: -25,
    color: Colors.black.withValues(alpha: 0.1),
  );

  static const InputDecoration inputNoneBorder = InputDecoration(
    border: InputBorder.none,
    enabledBorder: InputBorder.none,
  );

  static final verticalShadow = BoxShadow(
      color: AppColors.black.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));

  static final horizontalShadow = BoxShadow(
      color: AppColors.black.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));
}
