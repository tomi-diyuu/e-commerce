import 'package:e_commerce/generated/assets/assets.gen.dart';
import 'package:e_commerce/src/themes/colors.dart';
import 'package:flutter/material.dart';

class XBottomSign extends StatelessWidget {
  final String title;
  final Function()? onClickGoogle;
  const XBottomSign({super.key, required this.title, this.onClickGoogle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title),
        const SizedBox(
          height: 12,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _socialButton(Assets.images.icGoogle.keyName,
                onPressed: onClickGoogle ?? () {}),
            _socialButton(Assets.images.icFacebook.keyName, onPressed: () {})
          ],
        ),
      ],
    );
  }
}

Widget _socialButton(String image, {required Function() onPressed}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: 80,
      height: 60,
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
            offset: Offset(0, 1),
            color: AppColors.black,
            blurRadius: 8,
            spreadRadius: -8)
      ], borderRadius: BorderRadius.circular(20)),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.white,
        ),
        child: Image.asset(image),
      ),
    ),
  );
}
