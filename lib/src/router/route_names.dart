// ignore_for_file: unused_element

enum AppRouteNames {
  home(path: '/'),
  homeViewAll(path: '/viewAll', paramName: "title"),
  productList(path: '/all'),
  productDetail(path: '/detail', paramName: 'product'),
  shop(path: '/shop'),
  bag(path: '/bag'),
  favorite(path: '/favorite'),
  profile(path: '/profile'),
  signIn(path: '/sign-in'),
  signUp(path: '/sign-up'),
  forgotPassword(path: '/forgot'),
  settings(path: '/settings');

  const AppRouteNames({required this.path, this.paramName});

  final String path;
  final String? paramName;

  String get name => path;

  String get subPath {
    if (path == '/') return path;
    return path.replaceFirst('/', '');
  }

  String get buildPathParam => '$path:$paramName';

  String get buildSubPathParam => '$subPath:$paramName';
}
