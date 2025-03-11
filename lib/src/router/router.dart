import 'package:e_commerce/src/features/authentication/view/signin_page.dart';
import 'package:e_commerce/src/features/authentication/view/signup_page.dart';
import 'package:e_commerce/src/features/cart/view/cart_page.dart';
import 'package:e_commerce/src/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:e_commerce/src/features/dashboard/view/dashboard_page.dart';
import 'package:e_commerce/src/features/favorite/view/favorite_page.dart';
import 'package:e_commerce/src/features/view_all_product/cubit/paginate_view_all_cubit.dart';
import 'package:e_commerce/src/features/view_all_product/view/view_all_page.dart';
import 'package:e_commerce/src/features/product_detail/view/product_detail_page.dart';
import 'package:e_commerce/src/features/products_overview/view/products_overview_page.dart';
import 'package:e_commerce/src/features/settings/view/settings_page.dart';
import 'package:e_commerce/src/features/shop/cubit/category_cubit.dart';
import 'package:e_commerce/src/features/shop/view/shop_page.dart';
import 'package:e_commerce/src/network/model/product/product.dart';
import 'package:e_commerce/src/router/coordinator.dart';
import 'package:e_commerce/src/router/route_names.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import '../features/home/view/view.dart';
import '../features/profile/view/view.dart';

class AppRouter {
  late final router = GoRouter(
    navigatorKey: AppCoordinator.navigatorKey,
    initialLocation: AppRouteNames.home.path,
    routes: [
      GoRoute(
        path: AppRouteNames.signIn.path,
        name: AppRouteNames.signIn.name,
        builder: (_, __) => SigninPage(),
      ),
      GoRoute(
          path: AppRouteNames.signUp.path,
          name: AppRouteNames.signUp.name,
          builder: (_, __) => SignupPage()),
      ShellRoute(
          navigatorKey: AppCoordinator.shellKey,
          builder: (context, state, child) => DashboardPage(
                currentItem:
                    XNavigationBarItems.fromLocation(state.uri.toString()),
                body: child,
              ),
          routes: [
            GoRoute(
                path: AppRouteNames.home.path,
                name: AppRouteNames.home.name,
                pageBuilder: (context, state) => const NoTransitionPage(
                      child: HomePage(),
                    ),
                routes: [
                  GoRoute(
                      parentNavigatorKey: AppCoordinator.shellKey,
                      path: AppRouteNames.homeViewAll.subPath,
                      name: AppRouteNames.homeViewAll.name,
                      builder: (context, state) {
                        final viewAllCubit =
                            state.extra as PaginateViewAllCubit;
                        return ViewAllPage(
                          viewAllCubit: viewAllCubit,
                        );
                      })
                ]),
            GoRoute(
                parentNavigatorKey: AppCoordinator.shellKey,
                path: AppRouteNames.productList.path,
                name: AppRouteNames.productList.name,
                builder: (context, state) {
                  // Lây category thông qua extra từ trang home hoac trang shop
                  // Nếu từ trang home thì extra sẽ null nên sẽ khởi tạo mặc định
                  final categoryCubit = state.extra as CategoryCubit?;
                  return ProductsOverviewPage(
                      categoryCubit: categoryCubit ?? CategoryCubit());
                },
                routes: [
                  GoRoute(
                      path: AppRouteNames.productDetail.subPath,
                      name: AppRouteNames.productDetail.name,
                      builder: (_, state) {
                        final product = state.extra as MProduct;
                        return ProductDetailPage(product: product);
                      })
                ]),
            GoRoute(
                path: AppRouteNames.shop.path,
                name: AppRouteNames.shop.name,
                pageBuilder: (context, state) => const NoTransitionPage(
                      child: ShopPage(),
                    ),
                routes: []),
            GoRoute(
              path: AppRouteNames.bag.path,
              name: AppRouteNames.bag.name,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: CartPage(),
              ),
            ),
            GoRoute(
              path: AppRouteNames.favorite.path,
              name: AppRouteNames.favorite.name,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: FavoritePage(),
              ),
            ),
            GoRoute(
                path: AppRouteNames.profile.path,
                name: AppRouteNames.profile.name,
                pageBuilder: (context, state) => const NoTransitionPage(
                      child: ProfilePage(),
                    ),
                routes: [
                  GoRoute(
                      parentNavigatorKey: AppCoordinator.navigatorKey,
                      path: AppRouteNames.settings.subPath,
                      name: AppRouteNames.settings.name,
                      builder: (_, __) => SettingsPage())
                ]),
          ])
    ],
    debugLogDiagnostics: kDebugMode,
  );
}
