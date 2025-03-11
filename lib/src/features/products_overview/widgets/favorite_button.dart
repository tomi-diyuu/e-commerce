import 'package:e_commerce/src/themes/colors.dart';
import 'package:e_commerce/src/themes/decorations.dart';
import 'package:flutter/material.dart';

class XFavoriteButton extends StatelessWidget {
  const XFavoriteButton({super.key, this.onTap, this.isFavorite = false});

  final VoidCallback? onTap;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [AppDecorations.shadow]),
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: onTap,
        icon: isFavorite
            ? Icon(
                Icons.favorite,
                color: AppColors.primary,
              )
            : Icon(
                Icons.favorite_outline_sharp,
                color: AppColors.gray,
              ),
      ),
    );
  }
}
