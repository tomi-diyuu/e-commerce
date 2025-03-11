import 'package:e_commerce/src/themes/colors.dart';
import 'package:flutter/material.dart';

class XAppBarTheme {
  static const lightAppBarTheme = AppBarTheme(
      centerTitle: false,
      scrolledUnderElevation: 0,
      elevation: 0,
      backgroundColor: AppColors.white,
      iconTheme: IconThemeData(color: AppColors.black, size: 24),
      actionsIconTheme: IconThemeData(color: AppColors.black, size: 24),
      titleTextStyle: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.black));
}
