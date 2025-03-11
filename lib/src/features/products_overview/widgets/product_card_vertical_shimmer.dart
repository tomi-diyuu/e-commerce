import 'package:e_commerce/src/themes/colors.dart';
import 'package:e_commerce/widgets/card/card.dart';
import 'package:e_commerce/widgets/common/shimmer.dart';
import 'package:flutter/material.dart';


class XProductCardVerticalShimmer extends StatelessWidget {
  const XProductCardVerticalShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return XCard(
      borderColor: AppColors.background,
      padding: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image shimmer
          XShimmer(
            child: Container(
              width: 170,
              height: 180,
              color: Colors.grey[300],
            ),
          ),
          const SizedBox(height: 8),
          // Rating shimmer
          XShimmer(
            child: Container(
              width: 100,
              height: 14,
              color: Colors.grey[300],
            ),
          ),
          const SizedBox(height: 8),
          // Brand name shimmer
          XShimmer(
            child: Container(
              width: 120,
              height: 14,
              color: Colors.grey[300],
            ),
          ),
          const SizedBox(height: 8),
          // Product name shimmer
          XShimmer(
            child: Container(
              width: 140,
              height: 14,
              color: Colors.grey[300],
            ),
          ),
          const SizedBox(height: 8),
          // Price shimmer
          XShimmer(
            child: Container(
              width: 80,
              height: 14,
              color: Colors.grey[300],
            ),
          ),
        ],
      ),
    );
  }
}
