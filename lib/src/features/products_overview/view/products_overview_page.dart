import 'dart:io';

import 'package:e_commerce/src/features/products_overview/cubit/products_overview_cubit.dart';
import 'package:e_commerce/src/features/products_overview/widgets/categories_header.dart';
import 'package:e_commerce/src/features/products_overview/widgets/filter_header.dart';
import 'package:e_commerce/src/features/products_overview/widgets/product_view_type.dart';
import 'package:e_commerce/src/features/shop/cubit/category_cubit.dart';
import 'package:e_commerce/src/network/model/common/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsOverviewPage extends StatelessWidget {
  const ProductsOverviewPage({
    super.key,
    required this.categoryCubit,
  });

  final CategoryCubit? categoryCubit;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductsOverviewCubit>(
          create: (_) => ProductsOverviewCubit()
            ..onFetched(categoryCubit!.state.selectedCategory.id),
        ),
        if (categoryCubit != null)
          BlocProvider<CategoryCubit>.value(
            value: categoryCubit!,
          ),
      ],
      child: ProductsOverviewView(),
    );
  }
}

class ProductsOverviewView extends StatelessWidget {
  const ProductsOverviewView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CategoryCubit>().state;
    final categories = state.categories;
    final selectedCategory = state.selectedCategory;

    return BlocBuilder<ProductsOverviewCubit, ProductsOverviewState>(
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.search))
                ],
                backgroundColor: Colors.white,
                expandedHeight: 100,
                floating: true,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding:
                      EdgeInsetsDirectional.only(start: 16, bottom: 16),
                  title: Text(
                    selectedCategory.name!,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              if (categories.isNotEmpty)
                SliverPersistentHeader(
                  pinned: false,
                  delegate: CategoriesHeaderDelegate(
                    categories: categories,
                    selectedCategory: selectedCategory,
                  ),
                ),
              SliverPersistentHeader(
                pinned: true,
                delegate: FilterHeaderDelegate(),
              ),
              XProductViewType(
                layout: state.layout,
                products: state.sortedProducts,
                isLoading: state.status.isLoading,
              )
            ],
          ),
        );
      },
    );
  }
}
