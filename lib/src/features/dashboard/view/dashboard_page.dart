import 'package:e_commerce/src/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:e_commerce/src/features/dashboard/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({
    super.key,
    required this.currentItem,
    required this.body,
  });

  final XNavigationBarItems currentItem;
  final Widget body;

  @override
  State<DashboardPage> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(widget.currentItem),
      child: BlocBuilder<DashboardCubit, XNavigationBarItems>(
        builder: (context, state) {
          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, _) async {
              context.read<DashboardCubit>().goHome();
            },
            child: Scaffold(
              body: widget.body,
              bottomNavigationBar: const XBottomNavigationBar(),
            ),
          );
        },
      ),
    );
  }
}
