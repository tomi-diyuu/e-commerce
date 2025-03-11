import 'package:flutter/material.dart';

class XTextButton extends StatelessWidget {
  const XTextButton({super.key, required this.text, this.icon, this.onPressed});

  final String text;
  final IconData? icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return icon != null
        ? TextButton.icon(
            onPressed: onPressed,
            label: Text(text),
            icon: Icon(icon),
            iconAlignment: IconAlignment.end,
          )
        : TextButton(onPressed: onPressed, child: Text(text));
  }
}
