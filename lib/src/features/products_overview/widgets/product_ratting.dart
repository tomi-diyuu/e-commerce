import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class XProductRatting extends StatelessWidget {
  const XProductRatting({
    super.key,
    required this.ratting,
  });

  final double ratting;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RatingBarIndicator(
            rating: ratting,
            itemSize: 20,
            itemBuilder: (_, __) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                )),
        Text(
          "($ratting)",
          style: textStyle.labelLarge,
        ),
      ],
    );
  }
}