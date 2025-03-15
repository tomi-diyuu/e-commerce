import 'package:e_commerce/src/features/promotion/widgets/promo_input.dart';
import 'package:e_commerce/src/features/promotion/widgets/promotion_item.dart';
import 'package:e_commerce/src/network/model/promotion/promotion.dart';
import 'package:flutter/material.dart';

class XBottomSheetPromo extends StatelessWidget {
  const XBottomSheetPromo({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    final size = MediaQuery.of(context).size;
    final padding = size.width * 0.037;
    const sizedbox = SizedBox(
      height: 5,
    );

    return SizedBox(
        height: size.height * 0.4,
        child: Center // make this modal get full width
            (
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Your Promo Codes",
                  style: textStyle.titleLarge,
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: size.height * 0.3,
                  child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return XPromotionItem(
                          promotion: MPromotion(
                              id: "",
                              code: "123456",
                              discountPercentageValue: 0.15,
                              expireDate:
                                  DateTime.now().add(Duration(days: 6))),
                        );
                      }),
                )
              ],
            ),
          ),
        ));
  }
}
