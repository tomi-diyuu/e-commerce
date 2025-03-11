import 'package:e_commerce/src/themes/colors.dart';
import 'package:flutter/material.dart';

class InitialLoader extends StatelessWidget {
  const InitialLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: 50),
        child: Center(
            child: CircularProgressIndicator(
          color: AppColors.primary,
        )),
      ),
    );
  }
}
