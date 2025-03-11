import 'package:e_commerce/src/themes/colors.dart';
import 'package:e_commerce/widgets/card/card_section.dart';
import 'package:flutter/material.dart';

class XBottomSheetFilter extends StatelessWidget {
  const XBottomSheetFilter({super.key});

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
                  "Filter by",
                  style: textStyle.titleLarge,
                ),
                XCardSection(borderColor: AppColors.background, children: [
                  XCardSectionButton(title: "Popular"),
                  XCardSectionButton(title: "Popular"),
                  XCardSectionButton(title: "Popular"),
                  XCardSectionButton(title: "Popular"),
                  XCardSectionButton(title: "Popular"),
                ])
              ],
            ),
          ),
        ));
  }
}
