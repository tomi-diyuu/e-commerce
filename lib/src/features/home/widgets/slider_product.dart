import 'package:e_commerce/src/features/products_overview/widgets/product_card_vertical.dart';
import 'package:e_commerce/src/features/products_overview/widgets/product_card_vertical_shimmer.dart';
import 'package:e_commerce/src/network/model/product/product.dart';
import 'package:e_commerce/widgets/text/header.dart';
import 'package:flutter/material.dart';

class SliderProduct extends StatelessWidget {
  final String title;
  final String? subTitle;
  final VoidCallback? onPressedViewAll;
  final bool isLarge;
  final List<MProduct> products;
  final bool isLoading;
  const SliderProduct(
      {super.key,
      this.isLarge = false,
      this.onPressedViewAll,
      required this.title,
      this.subTitle,
      this.isLoading = false,
      this.products = const []});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: SizedBox(
        height: 400,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            XHeader(
                title: title,
                subTile: subTitle,
                isLarge: isLarge,
                onPressedViewAll: isLoading ? null : onPressedViewAll),
            const SizedBox(
              height: 20,
            ),
            isLoading
                ? Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: XProductCardVerticalShimmer());
                        },
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: 3),
                  )
                : Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: XProductCardVertical(
                                currentProduct: product,
                              ));
                        },
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: products.length),
                  ),
          ],
        ),
      ),
    );
  }
}
