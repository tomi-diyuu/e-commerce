import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/features/products_overview/cubit/products_overview_cubit.dart';
import 'package:e_commerce/src/features/products_overview/widgets/product_card_horizontal.dart';
import 'package:e_commerce/src/features/products_overview/widgets/product_view_type.dart';
import 'package:e_commerce/src/features/view_all_product/cubit/paginate_view_all_cubit.dart';
import 'package:e_commerce/src/network/model/product/product.dart';
import 'package:e_commerce/src/network/model/product/product_filter.dart';
import 'package:e_commerce/src/themes/colors.dart';
import 'package:e_commerce/widgets/paginate/custom_paginate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewAllPage extends StatelessWidget {
  const ViewAllPage({super.key, required this.viewAllCubit});

  final PaginateViewAllCubit viewAllCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewAllCubit,
      child: ViewAllView(),
    );
  }
}

class ViewAllView extends StatelessWidget {
  const ViewAllView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaginateViewAllCubit, PaginateViewAllState>(
      builder: (context, state) {
        final List<MProduct> items =
            ((state.docs.data as List<DocumentSnapshot>?) ?? [])
                .map((e) => e.data() as MProduct)
                .toList();
        return Scaffold(
            body: CustomPaginate(
                header: SliverAppBar(
                  pinned: true,
                  title: Text(
                    state.productType.name.toUpperCase(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                fetchFirstData: () =>
                    context.read<PaginateViewAllCubit>().fetchFirstData(),
                fetchNextData: () =>
                    context.read<PaginateViewAllCubit>().fetchNextData(),
                paginate: state.docs,
                body: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 16),
                      child: XProductCardHorizontal(
                        currentProduct: items[index],
                      ),
                    );
                  }, childCount: items.length),
                )));
      },
    );
  }
}
