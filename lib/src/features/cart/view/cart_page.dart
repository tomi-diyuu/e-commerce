import 'package:e_commerce/src/features/account/bloc/account_bloc.dart';
import 'package:e_commerce/src/features/cart/cubit/cart_cubit.dart';
import 'package:e_commerce/src/features/cart/widgets/item_cart.dart';
import 'package:e_commerce/src/features/products_overview/widgets/product_card_horizontal_shimmer.dart';
import 'package:e_commerce/src/features/promotion/widgets/promo_input.dart';
import 'package:e_commerce/src/network/model/common/status.dart';
import 'package:e_commerce/src/router/coordinator.dart';
import 'package:e_commerce/src/themes/colors.dart';
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
    final cartState = context.watch<CartCubit>().state;
    final textStyle = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: XScreenPadding(
        mediaQuery: MediaQuery.of(context),
        child: SingleChildScrollView(
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
                    cartState.status.isLoading
                        ? ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return XProductCardHorizontalShimmer();
                            })
                        : ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: cartState.cart.items.length,
                            itemBuilder: (context, index) {
                              final item = cartState.cart.items[index];
                              return XItemCart(
                                item: item,
                                onRemove: () => _cartCubit.removeItem(item.id),
                              );
                            }),
                    XPromoInput(),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total amount: ",
                            style: textStyle.titleMedium!
                                .copyWith(color: AppColors.gray)),
                        Text(
                          "${cartState.cart.totalPrice}\$",
                          style: textStyle.titleLarge,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    XButton(
                        size: MButtonSize.primary(width: double.infinity),
                        type: ButtonType.elevated,
                        text: "CHECK OUT"),
                  ] else ...[
                    XTextButton(
                        onPressed: () {
                          AppCoordinator.showSignInScreen();
                        },
                        text: "Sign in / Sign up")
                  ]
                  // List item in cart
                ],
              );
            },
          ),
        ),
      ),
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
