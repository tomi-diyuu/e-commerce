import 'package:e_commerce/src/features/product_detail/cubit/product_detail_cubit.dart';
import 'package:e_commerce/src/themes/colors.dart';
import 'package:e_commerce/widgets/card/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XBottomSheetVariants extends StatelessWidget {
  const XBottomSheetVariants({super.key, required this.sizes});

  final List<String> sizes;


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
                  "Select size",
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
                          itemCount: sizes.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => context
                                  .read<ProductDetailCubit>()
                                  .onSelectedSizeIndexChanged(index),
                              child: XCard(
                                borderColor: state.selectedSize == index
                                    ? AppColors.primary
                                    : AppColors.gray,
                                child: Center(child: Text(sizes[index])),
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
