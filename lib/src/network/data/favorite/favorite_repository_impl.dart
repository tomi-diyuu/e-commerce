import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/network/data/favorite/favorite_repository.dart';
import 'package:e_commerce/src/network/data/product/product_reference.dart';
import 'package:e_commerce/src/network/data/user/user_reference.dart';
import 'package:e_commerce/src/network/model/common/result.dart';
import 'package:e_commerce/src/network/model/product/product.dart';
import 'package:e_commerce/src/network/model/user/user.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final userRef = UserReference();
  final productRef = ProductReference();
  @override
  Future<MResult<MUser>> addProductToFavorite(
      String userId, String productId) async {
    final user = await userRef.get(userId);
    if (user.isSuccess) {
      final updatedFavoriteList = List<String>.from(user.data!.favorites);
      if (updatedFavoriteList.contains(productId)) return MResult.error("");
      updatedFavoriteList.add(productId);
      final updatedUser = await userRef
          .updateUser(user.data!.copyWith(favorites: updatedFavoriteList));
      return updatedUser;
    }
    return MResult.error("User not found");
  }

  @override
  Future<MResult<void>> removeProductToFavorite(String productId) {
    // TODO: implement removeProductToFavorite
    throw UnimplementedError();
  }

  @override
  Future<MResult<List<DocumentSnapshot<MProduct>>>> getNextFavoriteProducts(
      String userId) {
    // TODO: implement getNextFavoriteProducts
    throw UnimplementedError();
  }
}
