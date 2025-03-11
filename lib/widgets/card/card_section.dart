import 'package:e_commerce/src/themes/colors.dart';
import 'package:e_commerce/widgets/card/card.dart';
import 'package:flutter/material.dart';

class XCardSection extends StatelessWidget {
  const XCardSection({super.key, required this.children, this.borderColor});
  final List<Widget> children;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return XCard(
      borderColor: borderColor,
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          for (int i = 0; i < children.length; i++) ...[
            children[i],
            if (i < (children.length - 1))
              Divider(
                height: 0.5,
                endIndent: 0,
                indent: 0,
                color: AppColors.gray.withOpacity(0.5),
              )
          ]
        ],
      ),
    );
  }
}

class XCardSectionButton extends StatelessWidget {
  const XCardSectionButton(
      {required this.title,
      this.subTitle,
      super.key,
      this.onTap,
      this.trailingIcon,
      this.isSelected = false});

  final String title;
  final String? subTitle;

  final IconData? trailingIcon;
  final VoidCallback? onTap;

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        color: isSelected ? AppColors.primary : AppColors.background,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textStyle.titleMedium!.copyWith(
                      color: isSelected ? AppColors.white : AppColors.black),
                ),
                if (subTitle != null) Text(subTitle!),
              ],
            )),
            if (trailingIcon != null)
              Icon(
                trailingIcon!,
                color: AppColors.gray,
              ),
          ],
        ),
      ),
    );
  }
}
