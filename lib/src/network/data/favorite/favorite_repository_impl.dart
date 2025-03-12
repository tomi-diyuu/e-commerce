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
      String userId,
      {DocumentSnapshot<MProduct>? lastDocument,
      int limit = 5}) async {
    try {
      final user = await userRef.get(userId);

      if (user.isError || user.data!.favorites.isEmpty) {
        return MResult.success([]); // Không có sản phẩm yêu thích
      }

      List<String> favoriteProductIds = user.data!.favorites;

      // Firestore giới hạn 10 phần tử trong whereIn, chia nhỏ nếu lớn hơn 10
      List<DocumentSnapshot<MProduct>> allProducts = [];
      for (int i = 0; i < favoriteProductIds.length; i += 10) {
        List<String> batch = favoriteProductIds.sublist(
            i,
            (i + 10 > favoriteProductIds.length)
                ? favoriteProductIds.length
                : i + 10);

        final result = await productRef.paginateQuery1(
          queryBuilder: (q) => q.where(FieldPath.documentId, whereIn: batch),
          lastDocument: lastDocument,
          limit: limit,
        );

        if (result.isSuccess) {
          allProducts.addAll(result.data!);
          if (result.data!.length < limit) {
            break; // Không còn dữ liệu để phân trang
          }
        }
      }

      return MResult.success(allProducts);
    } catch (e) {
      return MResult.exception(e);
    }
  }
}
