import 'package:e_commerce/src/features/products_overview/widgets/product_card_horizontal.dart';
import 'package:e_commerce/src/network/model/product/product.dart';
import 'package:e_commerce/widgets/paginate/custom_paginate.dart';
import 'package:e_commerce/widgets/paginate/paginate.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FavoriteOverviewView();
  }
}

class FavoriteOverviewView extends StatelessWidget {
  const FavoriteOverviewView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<MProduct> items = [];
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
            fetchFirstData: () {},
            fetchNextData: () {},
            paginate: XPaginate(),
            body: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: XProductCardHorizontal(
                    currentProduct: items[index],
                  ),
                );
              }, childCount: items.length),
            )));
  }
}
