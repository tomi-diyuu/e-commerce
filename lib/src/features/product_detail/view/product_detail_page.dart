import 'package:e_commerce/src/features/account/bloc/account_bloc.dart';
import 'package:e_commerce/src/features/cart/cubit/cart_cubit.dart';
import 'package:e_commerce/src/features/home/widgets/slider_product.dart';
import 'package:e_commerce/src/features/product_detail/cubit/product_detail_cubit.dart';
import 'package:e_commerce/src/features/product_detail/widgets/bottom_sheet_color.dart';
import 'package:e_commerce/src/features/product_detail/widgets/bottom_sheet_size.dart';
import 'package:e_commerce/src/features/product_detail/widgets/product_image_slider.dart';
import 'package:e_commerce/src/features/products_overview/widgets/brand_name.dart';
import 'package:e_commerce/src/features/products_overview/widgets/favorite_button.dart';
import 'package:e_commerce/src/features/products_overview/widgets/product_card_horizontal.dart';
import 'package:e_commerce/src/features/products_overview/widgets/product_name.dart';
import 'package:e_commerce/src/features/products_overview/widgets/product_price.dart';
import 'package:e_commerce/src/features/products_overview/widgets/product_ratting.dart';
import 'package:e_commerce/src/network/model/cart/cart_item.dart';
import 'package:e_commerce/src/network/model/product/product.dart';
import 'package:e_commerce/src/themes/colors.dart';
import 'package:e_commerce/src/utils/concurrency.dart';
import 'package:e_commerce/widgets/bottom_sheet/modal_bottom.dart';
import 'package:e_commerce/widgets/button/button.dart';
import 'package:e_commerce/widgets/card/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, required this.product});

  final MProduct product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductDetailCubit(),
      child: ProductDetailView(product: product),
    );
  }
}

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({super.key, required this.product});

  final MProduct product;

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  late final CartCubit _cartCubit;

  @override
  void initState() {
    _cartCubit = context.read<CartCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ProductDetailCubit>().state;
    final sizebox = const SizedBox(
      height: 16,
    );
    final _accoutBloc = context.watch<AccountBloc>();
    final isFavorite = _accoutBloc.state.isProductFavorite(widget.product.id);
    return Scaffold(
        appBar: AppBar(
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.share))],
          title: Text(widget.product.name!),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            // Image slider
            XProductImageSlider(
              image: widget.product.image!,
              variantImage: widget.product.variants!
                  .map((product) => product.image!)
                  .toList(),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Size, color, favorite button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Size
                      GestureDetector(
                        onTap: () => XModalBottom.showModal(
                            context,
                            BlocProvider.value(
                              value: context.read<ProductDetailCubit>(),
                              child: XBottomSheetSize(
                                sizes: widget.product.sizes,
                              ),
                            )),
                        child: XCard(
                          background: AppColors.white,
                          child: SizedBox(
                            width: 150,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.product.sizes[state.selectedSize],
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_sharp,
                                  size: 24,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Color
                      GestureDetector(
                        onTap: () {
                          XModalBottom.showModal(
                              context,
                              BlocProvider.value(
                                value: context.read<ProductDetailCubit>(),
                                child: XBottomSheetColor(
                                  colors: widget.product.colors,
                                ),
                              ));
                        },
                        child: XCard(
                          background: AppColors.white,
                          child: SizedBox(
                            width: 150,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.product.colors[state.selectedColor],
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_sharp,
                                  size: 24,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      XFavoriteButton(
                        isFavorite: isFavorite,
                        onTap: () => _accoutBloc.add(ToggleFavoriteProduct(
                            productId: widget.product.id)),
                      )
                    ],
                  ),
                  sizebox,

                  // Product Name, Product Price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      XProductName(
                        name: widget.product.name!,
                        isSmall: false,
                      ),
                      XProductPrice(
                        oldPrice: widget.product.oldPrice!.formattedConcurrency,
                        newPrice: widget.product
                            .getPrice(state.selectedSize, state.selectedColor)!
                            .formattedConcurrency,
                        isLarge: true,
                      )
                    ],
                  ),

                  // Brand Name
                  Align(
                      alignment: Alignment.topLeft,
                      child: XBrandName(brandName: "H & M")),

                  // Rating
                  XProductRatting(ratting: widget.product.avgRating!),
                  sizebox,

                  // Description
                  ReadMoreText(
                      "Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.",
                      textAlign: TextAlign.justify,
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: ' Show more',
                      trimExpandedText: ' Less',
                      moreStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w600),
                      lessStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w600)),
                  sizebox,
                  XButton(
                      onPressed: () {
                        final newItem = MCartItem(
                            id: "",
                            productId: widget.product.id,
                            name: widget.product.name!,
                            price: widget.product.getPrice(
                                state.selectedSize, state.selectedColor)!,
                            color: widget.product.colors[state.selectedColor],
                            size: widget.product.sizes[state.selectedSize],
                            image: widget.product.image!);

                        context.read<CartCubit>().addToCart(newItem.copyWith(
                            id: _cartCubit.state.cart.getExistedId(newItem)));
                      },
                      size: MButtonSize.primary(width: double.infinity),
                      type: ButtonType.elevated,
                      text: "Add to cart"),
                  sizebox,

                  // Product Recomendation
                  SliderProduct(title: "You can also like this")
                ],
              ),
            )
          ],
        )));
  }

  @override
  void dispose() {
    _cartCubit.syncCartToServer();
    super.dispose();
  }
}
