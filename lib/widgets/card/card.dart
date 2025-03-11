import 'package:e_commerce/src/themes/colors.dart';
import 'package:flutter/material.dart';

class XCard extends StatelessWidget {
  const XCard({
    this.padding = const EdgeInsets.all(16),
    this.child,
    this.borderColor,
    this.height,
    this.background = AppColors.background,
    super.key,
  });
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  final Color? borderColor;
  final double? height;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: background,
        border: Border.all(
          color: borderColor ?? const Color(0xFFD9D9D9),
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
