import 'package:e_commerce/src/_dev/fake_data.dart';
import 'package:e_commerce/src/features/products_overview/cubit/products_overview_cubit.dart';
import 'package:e_commerce/src/features/products_overview/widgets/product_card_horizontal.dart';
import 'package:e_commerce/src/features/products_overview/widgets/product_card_horizontal_shimmer.dart';
import 'package:e_commerce/src/features/products_overview/widgets/product_card_vertical.dart';
import 'package:e_commerce/src/features/products_overview/widgets/product_card_vertical_shimmer.dart';
import 'package:e_commerce/src/network/model/product/product.dart';
import 'package:flutter/widgets.dart';

class XProductViewType extends StatelessWidget {
  const XProductViewType(
      {super.key,
      this.layout = MSliverLayout.list,
      this.products = const [],
      this.isLoading = false});

  final MSliverLayout layout;
  final List<MProduct> products;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return layout.isList
        ? isLoading
            ? SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: XProductCardHorizontalShimmer(),
                  );
                }, childCount: 3),
              )
            : SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: XProductCardHorizontal(
                      currentProduct: products[index],
                    ),
                  );
                }, childCount: products.length),
              )
        : isLoading
            ? SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: XProductCardVerticalShimmer(),
                  );
                }, childCount: 3),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                ))
            : SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: XProductCardVertical(
                      currentProduct: products[index],
                    ),
                  );
                }, childCount: products.length),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                ));
  }
}
