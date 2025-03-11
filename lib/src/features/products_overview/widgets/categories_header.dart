import 'package:e_commerce/src/features/products_overview/cubit/products_overview_cubit.dart';
import 'package:e_commerce/src/features/shop/cubit/category_cubit.dart';
import 'package:e_commerce/src/network/model/category/category.dart';
import 'package:e_commerce/src/themes/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesHeaderDelegate extends SliverPersistentHeaderDelegate {
  final List<MCategory> categories;
  final MCategory selectedCategory;
  final ScrollController _scrollController = ScrollController();

  CategoriesHeaderDelegate({
    required this.categories,
    required this.selectedCategory,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _scrollToSelected(selectedCategory.id));
    return Container(
      color: AppColors.white,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          final category = categories[index];
          return _buildCategoryItem(context, category);
        },
      ),
    );
  }

  void _scrollToSelected(String id) {
    if (!_scrollController.hasClients) return;

    int selectedIndex = categories.indexWhere((c) => c.id == id);
    if (selectedIndex != -1) {
      double itemWidth = 110.0;
      double targetOffset = selectedIndex * itemWidth;

      _scrollController.animateTo(
        targetOffset,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Widget _buildCategoryItem(BuildContext context, MCategory category) {
    final bool isSelected = selectedCategory.id == category.id;

    return GestureDetector(
      onTap: () async {
        _scrollToSelected(category.id);
        await context.read<CategoryCubit>().onSelectedCategoryChanged(category);
        await context.read<ProductsOverviewCubit>().onFetched(category.id);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Container(
          padding: const EdgeInsets.all(9),
          width: 100,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : AppColors.black,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              category.name ?? '',
              style: TextStyle(color: AppColors.white),
            ),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant CategoriesHeaderDelegate oldDelegate) {
    return selectedCategory != oldDelegate.selectedCategory ||
        categories != oldDelegate.categories;
  }
}
