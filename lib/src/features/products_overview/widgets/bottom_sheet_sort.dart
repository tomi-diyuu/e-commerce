import 'package:e_commerce/src/features/products_overview/cubit/products_overview_cubit.dart';
import 'package:e_commerce/src/network/model/product/product_sort.dart';
import 'package:e_commerce/src/themes/colors.dart';
import 'package:e_commerce/widgets/card/card_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XBottomSheetSort extends StatelessWidget {
  const XBottomSheetSort({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    final size = MediaQuery.of(context).size;
    final padding = size.width * 0.037;
    const sizedbox = SizedBox(
      height: 32,
    );

    return BlocBuilder<ProductsOverviewCubit, ProductsOverviewState>(
      builder: (context, state) {
        return SizedBox(
            height: size.height * 0.4,
            child: Center // make this modal get full width
                (
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: padding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Short by",
                      style: textStyle.titleLarge,
                    ),
                    sizedbox,
                    XCardSection(borderColor: AppColors.background, children: [
                      XCardSectionButton(
                        title: "Price: lowest to high",
                        isSelected: state.sorter.isPriceLowToHigh,
                        onTap: () => context
                            .read<ProductsOverviewCubit>()
                            .onChangeSorter(MProductSort.priceLowToHigh),
                      ),
                      XCardSectionButton(
                          title: "Price: highest to low",
                          isSelected: state.sorter.isPriceHighToLow,
                          onTap: () => context
                              .read<ProductsOverviewCubit>()
                              .onChangeSorter(MProductSort.priceHighToLow)),
                    ])
                  ],
                ),
              ),
            ));
      },
    );
  }
}
