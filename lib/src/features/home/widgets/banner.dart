import 'package:e_commerce/generated/assets/assets.gen.dart';
import 'package:e_commerce/src/themes/colors.dart';
import 'package:flutter/material.dart';

class BannerHome extends StatelessWidget {
  const BannerHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(
          Assets.images.banner.keyName,
          height: size.height * 0.24,
          width: size.width,
          fit: BoxFit.fill,
        ),
        Positioned(
          bottom: size.height * 0.1,
          left: size.height * 0.0257,
          child: Text(
            "Street clothes",
            style: TextStyle(
                fontSize: 34,
                height: 1,
                fontWeight: FontWeight.bold,
                color: AppColors.white),
          ),
        ),
      ],
    );
  }
}
