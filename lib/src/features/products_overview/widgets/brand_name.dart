import 'package:flutter/material.dart';

class XBrandName extends StatelessWidget {
  const XBrandName({super.key, required this.brandName});

  final String brandName;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Text(
      brandName,
      style: textStyle.labelLarge,
    );
  }
}
