import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/features/account/bloc/account_bloc.dart';
import 'package:e_commerce/src/features/favorite/cubit/favorite_cubit.dart';
import 'package:e_commerce/src/features/favorite/widgets/favorite_item.dart';
import 'package:e_commerce/src/features/products_overview/widgets/product_card_horizontal.dart';
import 'package:e_commerce/src/network/model/product/product.dart';
import 'package:e_commerce/widgets/paginate/custom_paginate.dart';
import 'package:e_commerce/widgets/paginate/paginate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCubit(),
      child: FavoriteOverviewView(),
    );
  }
}

class FavoriteOverviewView extends StatelessWidget {
  const FavoriteOverviewView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        return Scaffold(
            body: CustomPaginate(
                header: SliverAppBar(
                  pinned: true,
                  title: Text(
                    "Favorite",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                fetchFirstData: () =>
                    context.read<FavoriteCubit>().fetchFirstData(),
                fetchNextData: () =>
                    context.read<FavoriteCubit>().fetchNextData(),
                paginate: state.docs,
                body: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 16),
                      child: XFavoriteItem(
                        favItem: state.items[index],
                        onRemove: () {
                          context.read<FavoriteCubit>().removeItem(state
                              .items[index].id); // Xóa item ra khỏi danh sách
                          context.read<AccountBloc>().add(ToggleFavoriteProduct(
                              productId: state.items[index]
                                  .id)); // Xóa id ra khỏi fav account
                        },
                      ),
                    );
                  }, childCount: state.items.length),
                )));
      },
    );
  }
}
