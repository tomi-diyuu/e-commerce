import 'package:e_commerce/src/themes/colors.dart';
import 'package:flutter/material.dart';

class AppBarSign extends StatelessWidget implements PreferredSizeWidget {
  const AppBarSign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // bottomOpacity: 8,
      shadowColor: AppColors.white,
      iconTheme: const IconThemeData(color: AppColors.black),
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
