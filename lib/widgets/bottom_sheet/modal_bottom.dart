import 'package:e_commerce/src/themes/colors.dart';
import 'package:flutter/material.dart';

class XModalBottom {
  static void showModal(BuildContext context, Widget child) {
    const radius = Radius.circular(34);
    showModalBottomSheet<void>(
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: radius, topRight: radius)),
        backgroundColor: AppColors.background,
        builder: (BuildContext context) {
          return child;
        });
  }
}
