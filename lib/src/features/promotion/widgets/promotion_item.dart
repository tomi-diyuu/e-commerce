import 'package:e_commerce/src/features/cart/cubit/cart_cubit.dart';
import 'package:e_commerce/src/features/promotion/cubit/promotion_cubit.dart';
import 'package:e_commerce/src/network/model/promotion/promotion.dart';
import 'package:e_commerce/src/router/coordinator.dart';
import 'package:e_commerce/src/themes/colors.dart';
import 'package:e_commerce/src/utils/number.dart';
import 'package:e_commerce/widgets/button/button.dart';
import 'package:e_commerce/widgets/card/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XPromotionItem extends StatelessWidget {
  const XPromotionItem({super.key, required this.promotion});

  final MPromotion promotion;

  @override
  Widget build(BuildContext context) {
    final cartState = context.watch<CartCubit>().state;
    final isActive = promotion.isActive(cartState.cart.subTotal);

    void _handleApply() {
      context.read<PromotionCubit>().changedPromotion(promotion);
      AppCoordinator.pop();
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          XCard(
            height: 105,
            borderColor: AppColors.white,
            padding: EdgeInsets.zero,
            background: AppColors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 105,
                      height: 105,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.1, 0.8],
                            colors: [
                              Colors.deepOrange,
                              AppColors.primary,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(16)),
                    ),
                    SizedBox(
                      width: 105,
                      height: 105,
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              (promotion.discountPercentageValue! * 100)
                                  .normalizeNumber,
                              style: TextStyle(
                                  fontSize: 32, color: AppColors.white),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              "%\noff",
                              style: TextStyle(color: AppColors.white),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      promotion.code!,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: 150,
                      child: Text(
                        textAlign: TextAlign.center,
                        promotion.description!,
                        maxLines: 2,
                      ),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${promotion.remainDays} days remaining"),
                    const SizedBox(
                      height: 6,
                    ),
                    XButton(
                        onPressed: _handleApply,
                        size: MButtonSize.primary(width: 93),
                        type: ButtonType.elevated,
                        text: "Apply")
                  ],
                )
              ],
            ),
          ),
          if (!isActive)
            Container(
              height: 105,
              decoration: BoxDecoration(color: Colors.white60),
            )
        ],
      ),
    );
  }
}
