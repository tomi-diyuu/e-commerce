import 'package:e_commerce/generated/assets/assets.gen.dart';
import 'package:e_commerce/src/features/product_detail/cubit/product_detail_cubit.dart';
import 'package:e_commerce/src/themes/colors.dart';
import 'package:e_commerce/widgets/image/rounded_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XProductImageSlider extends StatelessWidget {
  const XProductImageSlider(
      {super.key,
      required this.image,
      required this.variantImage,
      this.selectedIndex = 0});

  final String image;
  final List<String> variantImage;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailCubit, ProductDetailState>(
      builder: (context, state) {
        return Stack(
          children: [
            // Main large image

            XRoundedImage(
              height: 350,
              width: double.infinity,
              imageUrl: variantImage[state.selectedImageIndex],
              applyImageRadius: false,
              isOverlay: true,
            ),

            Positioned(
              right: 0,
              bottom: 30,
              left: 16,
              child: SizedBox(
                height: 100,
                child: ListView.separated(
                  separatorBuilder: (_, __) => const SizedBox(
                    width: 8,
                  ),
                  itemCount: variantImage.length,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => XRoundedImage(
                    onPressed: () => context
                        .read<ProductDetailCubit>()
                        .onSelectedImageIndexChanged(index),
                    backgroundColor: Colors.white,
                    width: 80,
                    border: Border.all(
                        color: state.selectedImageIndex == index
                            ? AppColors.primary
                            : AppColors.gray),
                    imageUrl: variantImage[index],
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
