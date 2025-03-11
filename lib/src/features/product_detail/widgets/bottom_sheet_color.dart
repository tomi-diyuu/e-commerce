import 'package:e_commerce/src/features/product_detail/cubit/product_detail_cubit.dart';
import 'package:e_commerce/src/themes/colors.dart';
import 'package:e_commerce/widgets/card/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XBottomSheetColor extends StatelessWidget {
  const XBottomSheetColor({super.key, required this.colors});

  final List<String> colors;

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
                  "Select color",
                  style: textStyle.titleLarge,
                ),
                const SizedBox(
                  height: 16,
                ),
                BlocBuilder<ProductDetailCubit, ProductDetailState>(
                  builder: (context, state) {
                    return SizedBox(
                      height: size.height * 0.3,
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 2,
                                  mainAxisSpacing: 20,
                                  crossAxisSpacing: 20),
                          itemCount: colors.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => context
                                  .read<ProductDetailCubit>()
                                  .onSelectedColorIndexChanged(index),
                              child: XCard(
                                borderColor: state.selectedColor == index
                                    ? AppColors.primary
                                    : AppColors.gray,
                                child: Center(child: Text(colors[index])),
                              ),
                            );
                          }),
                    );
                  },
                )
              ],
            ),
          ),
        ));
  }
}
