import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/network/model/common/result.dart';
import 'package:e_commerce/src/network/model/product/product.dart';
import 'package:e_commerce/src/network/model/user/user.dart';

abstract class FavoriteRepository {
  Future<MResult<MUser>> addProductToFavorite(String userId, String productId);
  Future<MResult<void>> removeProductToFavorite(String productId);

  Future<MResult<List<DocumentSnapshot<MProduct>>>> getNextFavoriteProducts(
      String userId,
      {DocumentSnapshot<MProduct>? lastDocument,
      int limit = 5});
}
