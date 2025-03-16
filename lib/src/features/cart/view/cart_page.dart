import 'package:e_commerce/src/features/account/bloc/account_bloc.dart';
import 'package:e_commerce/src/features/cart/cubit/cart_cubit.dart';
import 'package:e_commerce/src/features/cart/widgets/item_cart.dart';
import 'package:e_commerce/src/features/products_overview/widgets/product_card_horizontal_shimmer.dart';
import 'package:e_commerce/src/features/promotion/cubit/promotion_cubit.dart';
import 'package:e_commerce/src/features/promotion/widgets/bottom_sheet_promo.dart';
import 'package:e_commerce/src/features/promotion/widgets/promo_input.dart';
import 'package:e_commerce/src/network/model/common/status.dart';
import 'package:e_commerce/src/router/coordinator.dart';
import 'package:e_commerce/src/themes/colors.dart';
import 'package:e_commerce/widgets/bottom_sheet/modal_bottom.dart';
import 'package:e_commerce/widgets/button/button.dart';
import 'package:e_commerce/widgets/button/text_button.dart';
import 'package:e_commerce/widgets/screen/screen_padding.dart';
import 'package:e_commerce/widgets/text/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late final CartCubit _cartCubit;
  @override
  void initState() {
    super.initState();
    _cartCubit = context.read<CartCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: XScreenPadding(
        mediaQuery: MediaQuery.of(context),
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (context) => PromotionCubit(),
            child: BlocBuilder<AccountBloc, AccountState>(
              builder: (context, state) {
                return Column(
                  children: [
                    XHeader(
                      title: "My bag",
                      isLarge: true,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    if (state.isLogin) ...[
                      BlocBuilder<CartCubit, CartState>(
                        builder: (context, state) {
                          return _buildCartItems(context);
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      _buildPromotionInput(context),
                      _buildTotalAmount(context),
                      const SizedBox(
                        height: 16,
                      ),
                      _buildCheckoutButton()
                    ] else ...[
                      _buildAuthButton()
                    ]
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _handleShowBottomSheetPromo(BuildContext context) {
    XModalBottom.showModal(
        context,
        BlocProvider.value(
          value: context.read<PromotionCubit>(),
          child: XBottomSheetPromo(),
        ));
  }

  Widget _buildLoadingWidget() {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          return XProductCardHorizontalShimmer();
        });
  }

  Widget _buildCartItems(BuildContext context) {
    if (_cartCubit.state.status.isLoading) return _buildLoadingWidget();
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: _cartCubit.state.cart.items.length,
      itemBuilder: (context, index) {
        final item = _cartCubit.state.cart.items[index];
        return XItemCart(
          item: item,
          onRemove: () => _cartCubit.removeItem(item.id),
        );
      },
    );
  }

  Widget _buildPromotionInput(BuildContext context) {
    return BlocBuilder<PromotionCubit, PromotionState>(
      builder: (_, promoState) {
        return XPromoInput(
          value: promoState.code,
          onClearPromotion: () =>
              context.read<PromotionCubit>().clearedPromotion(),
          onChanged: (value) =>
              context.read<PromotionCubit>().changedCode(value),
          onPressedArrowIcon: () => _handleShowBottomSheetPromo(context),
        );
      },
    );
  }

  Widget _buildTotalAmount(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total amount:",
                style: textStyle.titleMedium?.copyWith(color: AppColors.gray)),
            Text("${state.cart.totalPrice}\$",
                style: textStyle.titleLarge),
          ],
        );
      },
    );
  }

  Widget _buildCheckoutButton() {
    return XButton(
      size: MButtonSize.primary(width: double.infinity),
      type: ButtonType.elevated,
      text: "CHECK OUT",
    );
  }

  Widget _buildAuthButton() {
    return XTextButton(
      onPressed: AppCoordinator.showSignInScreen,
      text: "Sign in / Sign up",
    );
  }

  @override
  void dispose() {
    //context.read<CartCubit>().syncCartToServer(); sử dụng context.read khi widget bị hủy sẽ không tìm thấy context
    // nên sẽ lưu cartCubit vào init state
    _cartCubit.syncCartToServer(); // lưu thay đổi lên server
    super.dispose();
  }
}
