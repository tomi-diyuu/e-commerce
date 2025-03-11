import 'package:e_commerce/src/features/shop/cubit/category_cubit.dart';
import 'package:e_commerce/src/features/view_all_product/cubit/paginate_view_all_cubit.dart';
import 'package:e_commerce/src/network/model/product/product.dart';
import 'package:e_commerce/src/network/model/product/product_filter.dart';
import 'package:e_commerce/src/router/route_names.dart';
import 'package:e_commerce/src/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class AppCoordinator {
  static AppRouter get rootRouter => GetIt.I<AppRouter>();
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final shellKey = GlobalKey<NavigatorState>();
  static BuildContext get context => navigatorKey.currentState!.context;

  static void pop<T extends Object?>([T? result]) => context.pop(result);

  static void goNamed(String name,
          {Map<String, String> params = const <String, String>{},
          Map<String, dynamic> queryParams = const <String, dynamic>{},
          Object? extra}) =>
      context.goNamed(name,
          pathParameters: params, queryParameters: queryParams, extra: extra);

  static void showHomeScreen() => context.goNamed(AppRouteNames.home.name);

  static void showHomeViewAll(
      BuildContext context, MProductFilter productFiler) {
    final viewAllCubit = context.read<PaginateViewAllCubit>();
    viewAllCubit.onChangeProductFilter(productFiler);
    context.pushNamed(AppRouteNames.homeViewAll.name, extra: viewAllCubit);
  }

  static void showProductList(BuildContext context) {
    final categoryCubit = context.read<
        CategoryCubit?>(); // CategoryCubit có thể null nếu gọi từ trang Home

    context.pushNamed(AppRouteNames.productList.name, extra: categoryCubit);
  }

  static Future<T?> showSignInScreen<T extends Object?>() =>
      context.pushNamed<T>(AppRouteNames.signIn.name);

  static Future<T?> showSignUpScreen<T extends Object?>() =>
      context.pushNamed<T>(AppRouteNames.signUp.name);

  static Future<T?> showSettingsScreen<T extends Object?>() =>
      context.pushNamed<T>(AppRouteNames.settings.name);

  static Future<T?> showProductDetailScreen<T extends Object?>(
          MProduct product) =>
      context.pushNamed<T>(AppRouteNames.productDetail.name, extra: product);
}
