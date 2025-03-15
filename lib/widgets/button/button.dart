import 'package:e_commerce/src/themes/colors.dart';
import 'package:flutter/material.dart';

enum ButtonType { elevated, outlined }

class MButtonSize {
  MButtonSize(
      {required this.padding,
      this.shadow,
      required this.width,
      this.height = 48});

  final EdgeInsets padding;
  final BoxShadow? shadow;
  final double width;
  final double height;

  factory MButtonSize.primary({required double width}) {
    return MButtonSize(
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
      shadow: BoxShadow(
        offset: const Offset(0, 2),
        blurRadius: 8,
        spreadRadius: -8,
        color: AppColors.primary,
      ),
    );
  }

  factory MButtonSize.small({required double width}) {
    return MButtonSize(
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 52),
    );
  }
}

class XButton extends StatelessWidget {
  const XButton(
      {super.key,
      this.onPressed,
      this.busy = false,
      required this.size,
      required this.type,
      required this.text});

  final MButtonSize size;
  final ButtonType type;
  final VoidCallback? onPressed;
  final String text;
  final bool busy;

  @override
  Widget build(BuildContext context) {
    final child = Text(
      text,
    );

    return busy
        ? Center(child: CircularProgressIndicator())
        : type == ButtonType.elevated
            ? Container(
                width: size.width,
                height: size.height,
                decoration: size.shadow != null && onPressed != null
                    ? BoxDecoration(boxShadow: [size.shadow!])
                    : null,
                child: ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    padding: size.padding,
                  ),
                  child: child,
                ),
              )
            : OutlinedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(padding: size.padding),
                child: child);
  }
}
