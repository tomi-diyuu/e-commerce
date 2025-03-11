import 'package:e_commerce/src/features/products_overview/cubit/products_overview_cubit.dart';
import 'package:e_commerce/src/features/products_overview/widgets/bottom_sheet_filter.dart';
import 'package:e_commerce/src/features/products_overview/widgets/bottom_sheet_sort.dart';
import 'package:e_commerce/src/network/model/product/product_sort.dart';
import 'package:e_commerce/src/themes/colors.dart';
import 'package:e_commerce/src/themes/decorations.dart';
import 'package:e_commerce/widgets/bottom_sheet/modal_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get maxExtent => 32; // Tăng chiều cao
  @override
  double get minExtent => 32; // Tăng chiều cao

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.background, boxShadow: [AppDecorations.shadow]),
      padding: EdgeInsets.symmetric(
          horizontal: 16, vertical: 8), // Điều chỉnh padding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FilterButton(
            icon: Icons.filter_list,
            label: "Filters",
            onTap: () => XModalBottom.showModal(context, XBottomSheetFilter()),
          ),
          BlocBuilder<ProductsOverviewCubit, ProductsOverviewState>(
            builder: (context, state) {
              return FilterButton(
                icon: Icons.sort,
                label: state.sorter.toSorterString(),
                onTap: () {
                  XModalBottom.showModal(
                    context,
                    BlocProvider.value(
                      value: context.read<ProductsOverviewCubit>(),
                      child: XBottomSheetSort(),
                    ),
                  );
                },
              );
            },
          ),
          BlocBuilder<ProductsOverviewCubit, ProductsOverviewState>(
            builder: (context, state) {
              return FilterButton(
                icon: Icons.list,
                label: "",
                selectedIcon: Icons.grid_view_rounded,
                isSelected: state.layout.isGrid,
                onTap: () =>
                    context.read<ProductsOverviewCubit>().onChangeLayout(),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class FilterButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final IconData? selectedIcon;
  final bool isSelected;

  const FilterButton(
      {super.key,
      required this.icon,
      required this.label,
      this.onTap,
      this.selectedIcon,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(isSelected ? selectedIcon : icon,
              size: 24, color: AppColors.black),
          SizedBox(height: 4),
          Text(
            label,
          ),
        ],
      ),
    );
  }
}
