import 'package:e_commerce/src/themes/colors.dart';
import 'package:flutter/material.dart';

class XProductPrice extends StatelessWidget {
  const XProductPrice(
      {super.key,
      required this.oldPrice,
      required this.newPrice,
      this.isLarge = false});

  final double oldPrice;
  final double newPrice;
  final bool isLarge;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return RichText(
      text: TextSpan(
        text: "$newPrice\$ ",
        style: isLarge
            ? textStyle.titleLarge!.copyWith(
                color: AppColors.primary,
              )
            : TextStyle(color: AppColors.primary, fontWeight: FontWeight.w500),
        children: <TextSpan>[
          TextSpan(
              text: '$oldPrice\$',
              style: isLarge
                  ? textStyle.titleLarge!.copyWith(
                      decoration: TextDecoration.lineThrough,
                      color: AppColors.gray)
                  : textStyle.labelLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.lineThrough,
                    )),
        ],
      ),
    );
  }
}
