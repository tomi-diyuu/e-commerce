import 'package:flutter/material.dart';

class XProductName extends StatelessWidget {
  const XProductName({
    super.key,
    required this.name,
    this.isSmall = true,
  });

  final bool isSmall;
  final String name;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Text(
      name,
      style: isSmall ? textStyle.titleMedium : textStyle.titleLarge,
    );
  }
}