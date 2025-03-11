import 'package:e_commerce/src/features/account/bloc/account_bloc.dart';
import 'package:e_commerce/src/features/cart/cubit/cart_cubit.dart';
import 'package:e_commerce/src/router/coordinator.dart';
import 'package:e_commerce/src/themes/colors.dart';
import 'package:e_commerce/widgets/card/card_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoList extends StatelessWidget {
  const InfoList({super.key});

  @override
  Widget build(BuildContext context) {
    return XCardSection(borderColor: AppColors.background, children: [
      XCardSectionButton(
        title: "My orders",
        subTitle: "Already have 12 orders",
        trailingIcon: Icons.arrow_forward_ios,
        onTap: () {},
      ),
      XCardSectionButton(
        title: "Shipping addresses",
        subTitle: "3 ddresses",
        trailingIcon: Icons.arrow_forward_ios,
        onTap: () {},
      ),
      XCardSectionButton(
        title: "Payment methods",
        subTitle: "Visa **34",
        trailingIcon: Icons.arrow_forward_ios,
        onTap: () {},
      ),
      XCardSectionButton(
        title: "Promocodes",
        subTitle: "You have special promocodes",
        trailingIcon: Icons.arrow_forward_ios,
        onTap: () {},
      ),
      XCardSectionButton(
        title: "My reviews",
        subTitle: "Reviews for 4 items",
        trailingIcon: Icons.arrow_forward_ios,
        onTap: () {},
      ),
      XCardSectionButton(
        title: "Settings",
        subTitle: "Notifications, password",
        trailingIcon: Icons.arrow_forward_ios,
        onTap: () {
          AppCoordinator.showSettingsScreen();
        },
      ),
      XCardSectionButton(
        title: "Logout",
        trailingIcon: Icons.logout,
        onTap: () {
          context.read<AccountBloc>().add(AccountLogout());
        },
      ),
    ]);
  }
}
