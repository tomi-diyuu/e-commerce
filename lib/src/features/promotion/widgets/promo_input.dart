import 'package:e_commerce/src/features/promotion/widgets/bottom_sheet_promo.dart';
import 'package:e_commerce/src/themes/colors.dart';
import 'package:e_commerce/widgets/bottom_sheet/modal_bottom.dart';
import 'package:flutter/material.dart';

class XPromoInput extends StatelessWidget {
  const XPromoInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(8)),
          child: Text(
            "Enter your promo code",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColors.gray),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.black),
            child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () =>
                    XModalBottom.showModal(context, XBottomSheetPromo()),
                icon: Icon(
                  Icons.arrow_forward,
                  color: AppColors.white,
                )),
          ),
        )
      ],
    );
  }
}
