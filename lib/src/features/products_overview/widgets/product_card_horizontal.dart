import 'package:e_commerce/src/features/account/bloc/account_bloc.dart';
import 'package:e_commerce/src/features/products_overview/widgets/brand_name.dart';
import 'package:e_commerce/src/features/products_overview/widgets/favorite_button.dart';
import 'package:e_commerce/src/features/products_overview/widgets/product_name.dart';
import 'package:e_commerce/src/features/products_overview/widgets/product_price.dart';
import 'package:e_commerce/src/features/products_overview/widgets/product_ratting.dart';
import 'package:e_commerce/src/network/model/product/product.dart';
import 'package:e_commerce/src/router/coordinator.dart';
import 'package:e_commerce/src/themes/colors.dart';
import 'package:e_commerce/src/utils/concurrency.dart';
import 'package:e_commerce/widgets/card/card.dart';
import 'package:e_commerce/widgets/image/rounded_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class XProductCardHorizontal extends StatelessWidget {
  const XProductCardHorizontal({super.key, required this.currentProduct});

  final MProduct currentProduct;

  @override
  Widget build(BuildContext context) {
    final _accountBloc = context.watch<AccountBloc>();
    final isFavorite = _accountBloc.state.isProductFavorite(currentProduct.id);
    return GestureDetector(
      onTap: () => AppCoordinator.showProductDetailScreen(currentProduct),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: XCard(
              height: 105,
              borderColor: AppColors.white,
              padding: EdgeInsets.zero,
              background: AppColors.white,
              child: Row(
                children: [
                  // Image: chưa xử lý load ảnh
                  XRoundedImage(
                    imageUrl: currentProduct.image!,
                    width: 105,
                    height: 105,
                  ),

                  const SizedBox(
                    width: 16,
                  ),

                  // Detail
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name
                      XProductName(name: currentProduct.name!),

                      // Brand
                      XBrandName(brandName: "Dorothy Perkins"),

                      // Rattings
                      XProductRatting(ratting: currentProduct.avgRating!),

                      // Price
                      XProductPrice(
                        oldPrice: currentProduct.oldPrice!.formattedConcurrency,
                        newPrice: currentProduct.newPrice!.formattedConcurrency,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: XFavoriteButton(
                  isFavorite: isFavorite,
                  onTap: () {
                    _accountBloc.add(
                        ToggleFavoriteProduct(productId: currentProduct.id));
                  })),
        ],
      ),
    );
  }
}
