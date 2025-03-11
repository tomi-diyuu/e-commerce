import 'package:e_commerce/src/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XBottomNavigationBar extends StatelessWidget {
  const XBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, XNavigationBarItems>(
      builder: (context, state) {
        return NavigationBar(
          selectedIndex: state.index,
          onDestinationSelected:
              context.read<DashboardCubit>().onDestinationSelected,
          destinations: XNavigationBarItems.values
              .map((e) => NavigationDestination(
                    label: e.label,
                    icon: Image.asset(e.icon),
                    selectedIcon: Image.asset(e.selectedIcon),
                  ))
              .toList(),
        );
      },
    );
  }
}
