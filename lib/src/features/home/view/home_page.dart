import 'package:e_commerce/src/features/home/cubit/featured_products/featured_products_cubit.dart';
import 'package:e_commerce/src/features/home/cubit/new_products/new_products_cubit.dart';
import 'package:e_commerce/src/features/home/cubit/sale_products/sale_products_cubit.dart';
import 'package:e_commerce/src/features/home/widgets/banner.dart';
import 'package:e_commerce/src/features/home/widgets/slider_product.dart';
import 'package:e_commerce/src/features/view_all_product/cubit/paginate_view_all_cubit.dart';
import 'package:e_commerce/src/network/model/common/status.dart';
import 'package:e_commerce/src/network/model/product/product_filter.dart';
import 'package:e_commerce/src/router/coordinator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => NewProductsCubit()),
      BlocProvider(create: (_) => SaleProductsCubit()),
      BlocProvider(create: (_) => FeaturedProductsCubit()),
      BlocProvider(create: (_) => PaginateViewAllCubit())
    ], child: HomeView());
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.transparent,
          stretch: true,
          expandedHeight: size.height * 0.24,
          flexibleSpace: const FlexibleSpaceBar(
            stretchModes: [
              StretchMode.blurBackground,
              StretchMode.zoomBackground
            ],
            background: BannerHome(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 18, top: 18),
              child: Column(children: [
                BlocBuilder<SaleProductsCubit, SaleProductsState>(
                  builder: (context, state) {
                    return SliderProduct(
                      isLoading: state.status.isLoading,
                      onPressedViewAll: () {
                        AppCoordinator.showHomeViewAll(
                            context, MProductFilter.sale);
                      },
                      title: "Sale",
                      subTitle: "Super summer sale",
                      isLarge: true,
                      products: state.saleProducts,
                    );
                  },
                ),
                BlocBuilder<NewProductsCubit, NewProductsState>(
                  builder: (context, state) {
                    return SliderProduct(
                      isLoading: state.status.isLoading,
                      onPressedViewAll: () => AppCoordinator.showHomeViewAll(
                          context, MProductFilter.news),
                      title: "New",
                      subTitle: "You’ve never seen it before!",
                      isLarge: true,
                      products: state.newProducts,
                    );
                  },
                ),
                BlocBuilder<FeaturedProductsCubit, FeaturedProductsState>(
                  builder: (context, state) {
                    return SliderProduct(
                      isLoading: state.status.isLoading,
                      onPressedViewAll: () => AppCoordinator.showHomeViewAll(
                          context, MProductFilter.featured),
                      title: "Featured",
                      subTitle: "You’ve never seen it before!",
                      isLarge: true,
                      products: state.featuredProducts,
                    );
                  },
                ),
              ]),
            );
          }, childCount: 1),
        ),
      ],
    ));
  }
}
