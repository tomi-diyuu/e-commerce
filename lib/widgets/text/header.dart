import 'package:flutter/material.dart';

class XHeader extends StatelessWidget {
  const XHeader(
      {super.key,
      required this.title,
      this.subTile,
      this.onPressedViewAll,
      this.isLarge = false});

  final String title;
  final String? subTile;
  final bool isLarge;
  final VoidCallback? onPressedViewAll;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style:
                    isLarge ? textStyle.headlineLarge : textStyle.titleLarge),
            subTile != null
                ? Text(
                    subTile!,
                    style: textStyle.labelLarge,
                  )
                : SizedBox(),
          ],
        ),
        onPressedViewAll != null
            ? TextButton(
                onPressed: onPressedViewAll,
                child: Text(
                  'View all',
                  style: Theme.of(context).textTheme.labelLarge,
                ))
            : SizedBox()
      ],
    );
  }
}
