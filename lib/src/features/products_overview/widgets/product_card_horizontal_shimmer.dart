import 'package:e_commerce/src/themes/colors.dart';
import 'package:e_commerce/widgets/card/card.dart';
import 'package:e_commerce/widgets/common/shimmer.dart';
import 'package:flutter/material.dart';

class XProductCardHorizontalShimmer extends StatelessWidget {
  const XProductCardHorizontalShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: XCard(
        height: 105,
        borderColor: AppColors.white,
        padding: EdgeInsets.zero,
        background: AppColors.white,
        child: Row(
          children: [
            // Image: chưa xử lý load ảnh
            XShimmer(
              child: Container(
                width: 105,
                height: 105,
                color: Colors.grey[300],
              ),
            ),

            const SizedBox(
              width: 16,
            ),

            // Detail
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name
                XShimmer(
                  child: Container(
                    width: 120,
                    height: 14,
                    color: Colors.grey[300],
                  ),
                ),

                const SizedBox(height: 8),

                // Brand
                XShimmer(
                  child: Container(
                    width: 140,
                    height: 14,
                    color: Colors.grey[300],
                  ),
                ),
                const SizedBox(height: 8),

                // Rattings
                XShimmer(
                  child: Container(
                    width: 100,
                    height: 14,
                    color: Colors.grey[300],
                  ),
                ),
                const SizedBox(height: 8),

                // Price
                XShimmer(
                  child: Container(
                    width: 80,
                    height: 14,
                    color: Colors.grey[300],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
