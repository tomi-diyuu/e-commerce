import 'package:e_commerce/src/themes/colors.dart';
import 'package:flutter/material.dart';

class LoadMoreWidget extends StatelessWidget {
  const LoadMoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
        child: Padding(
      padding: EdgeInsets.all(5),
      child: Center(
        child: Text(
          'Loading',
          style: TextStyle(
              color: AppColors.primary,
              fontSize: 17,
              fontWeight: FontWeight.normal),
        ),
      ),
    ));
  }
}
