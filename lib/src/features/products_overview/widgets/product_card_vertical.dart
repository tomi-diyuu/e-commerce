import 'package:e_commerce/src/features/account/bloc/account_bloc.dart';
import 'package:e_commerce/src/features/products_overview/widgets/brand_name.dart';
import 'package:e_commerce/src/features/products_overview/widgets/favorite_button.dart';
import 'package:e_commerce/src/features/products_overview/widgets/product_card_horizontal.dart';
import 'package:e_commerce/src/features/products_overview/widgets/product_name.dart';
import 'package:e_commerce/src/features/products_overview/widgets/product_price.dart';
import 'package:e_commerce/src/features/products_overview/widgets/product_ratting.dart';
import 'package:e_commerce/src/network/domain_manager.dart';
import 'package:e_commerce/src/network/model/product/product.dart';
import 'package:e_commerce/src/router/coordinator.dart';
import 'package:e_commerce/src/themes/colors.dart';
import 'package:e_commerce/widgets/card/card.dart';
import 'package:e_commerce/widgets/image/rounded_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XProductCardVertical extends StatelessWidget {
  const XProductCardVertical({super.key, required this.currentProduct});

  final MProduct currentProduct;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final _accountBloc = context.watch<AccountBloc>();
    final isFavorite = _accountBloc.state.isProductFavorite(currentProduct.id);
    return XCard(
      borderColor: AppColors.background,
      padding: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image, sale
          GestureDetector(
            onTap: () => AppCoordinator.showProductDetailScreen(currentProduct),
            child: Stack(
              children: [
                // Image
                Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: XRoundedImage(
                        imageUrl: currentProduct.image!,
                        width: 170,
                        height: 180)),
                Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.primary,
                      ),
                      child: Text(
                        "-20%",
                        style: textStyle.labelLarge!.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )),

                Positioned(
                    bottom: 0,
                    right: 0,
                    child: XFavoriteButton(
                      isFavorite: isFavorite,
                      onTap: () => _accountBloc.add(
                          ToggleFavoriteProduct(productId: currentProduct.id)),
                    ))
              ],
            ),
          ),
          // ratting
          XProductRatting(ratting: currentProduct.avgRating!),
          // Brand name

          XBrandName(brandName: "Dorothy Perkins"),
          // Product name

          XProductName(name: currentProduct.name!),

          // Price
          XProductPrice(
            oldPrice: currentProduct.oldPrice!.toDouble(),
            newPrice: currentProduct.newPrice!.toDouble(),
          )
        ],
      ),
    );
  }
}
