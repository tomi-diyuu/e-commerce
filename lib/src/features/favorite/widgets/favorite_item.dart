import 'package:e_commerce/src/features/products_overview/widgets/product_name.dart';
import 'package:e_commerce/src/network/model/cart/cart_item.dart';
import 'package:e_commerce/src/themes/colors.dart';
import 'package:e_commerce/widgets/card/card.dart';
import 'package:e_commerce/widgets/image/rounded_image.dart';
import 'package:flutter/material.dart';


class XFavoriteItem extends StatelessWidget {
  const XFavoriteItem({super.key, required this.item, this.onRemove});

  final MCartItem item;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Stack(
        children: [
          XCard(
            height: 105,
            borderColor: AppColors.white,
            padding: EdgeInsets.zero,
            background: AppColors.white,
            child: Row(
              children: [
                XRoundedImage(
                  imageUrl: item.image,
                  width: 105,
                  height: 105,
                ),

                // Detail
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Name
                            XProductName(name: item.name),
                            // Size, Color
                            Row(
                              children: [
                                // Color
                                RichText(
                                  text: TextSpan(
                                    text: "Color: ",
                                    style: textStyle.labelLarge,
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: item.color,
                                          style: textStyle.bodyMedium!.copyWith(
                                              color: AppColors.black)),
                                    ],
                                  ),
                                ),

                                const SizedBox(
                                  width: 16,
                                ),

                                // Size
                                RichText(
                                  text: TextSpan(
                                    text: "Size: ",
                                    style: textStyle.labelLarge,
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: item.size,
                                          style: textStyle.bodyMedium!.copyWith(
                                              color: AppColors.black)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
              top: 8,
              right: 0,
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: onRemove,
                icon: Icon(
                  Icons.close,
                  color: AppColors.gray,
                ),
              ))
        ],
      ),
    );
  }
}
