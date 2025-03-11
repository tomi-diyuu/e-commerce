import 'package:e_commerce/src/network/blod/data/upload_repository_impl.dart';
import 'package:e_commerce/src/network/data/cart/cart_repository_impl.dart';
import 'package:e_commerce/src/network/data/category/category_repository_impl.dart';
import 'package:e_commerce/src/network/data/favorite/favorite_repository_impl.dart';
import 'package:e_commerce/src/network/data/product/product_repository_impl.dart';
import 'package:e_commerce/src/network/data/sign/sign_repository_impl.dart';
import 'package:e_commerce/src/network/data/user/user_repository_impl.dart';

class DomainManager {
  factory DomainManager() {
    _internal ??= DomainManager._();
    return _internal!;
  }

  DomainManager._();
  static DomainManager? _internal;

  final sign = SignRepositoryImpl();
  final user = UserRepositoryImpl();
  final product = ProductRepositoryImpl();
  final upload = UploadRepositoryImpl();
  final catgory = CategoryRepositoryImpl();
  final cart = CartRepositoryImpl();
  final favorite = FavoriteRepositoryImpl();
}
