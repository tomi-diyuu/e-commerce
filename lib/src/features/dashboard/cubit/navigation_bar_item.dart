part of 'dashboard_cubit.dart';

enum XNavigationBarItems {
  home(
    label: 'Home',
    route: AppRouteNames.home,
    icon: "assets/images/ic_home.png",
    selectedIcon: "assets/images/ic_activated_home.png",
  ),
  shop(
      label: 'Shop',
      route: AppRouteNames.shop,
      icon: "assets/images/ic_shop.png",
      selectedIcon: "assets/images/ic_activated_shop.png"),
  bag(
      label: 'Bag',
      route: AppRouteNames.bag,
      icon: "assets/images/ic_bag.png",
      selectedIcon: "assets/images/ic_activated_bag.png"),
  favorite(
      label: 'Favorite',
      route: AppRouteNames.favorite,
      icon: "assets/images/ic_heart.png",
      selectedIcon: "assets/images/ic_activated_heart.png"),
  profile(
    label: 'Profile',
    route: AppRouteNames.profile,
    icon: "assets/images/ic_profile.png",
    selectedIcon: "assets/images/ic_activated_profile.png",
  );

  const XNavigationBarItems({
    required this.label,
    required this.route,
    required this.icon,
    required this.selectedIcon,
  });

  final String label;
  final AppRouteNames route;
  final String icon;
  final String selectedIcon;

  static XNavigationBarItems fromLocation(String location) {
    if (location == XNavigationBarItems.home.route.name) {
      return XNavigationBarItems.home;
    }

    return XNavigationBarItems.home;
  }
}
