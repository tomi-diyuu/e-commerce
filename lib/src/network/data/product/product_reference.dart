import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/network/firebase/base_collection.dart';
import 'package:e_commerce/src/network/model/common/result.dart';
import 'package:e_commerce/src/network/model/product/product.dart';
import 'package:e_commerce/src/network/model/product/product_filter.dart';

class ProductReference extends BaseCollectionReference<MProduct> {
  ProductReference()
      : super(
          FirebaseFirestore.instance
              .collection('products')
              .withConverter<MProduct>(
                fromFirestore: (snapshot, options) =>
                    MProduct.fromJson(snapshot.data() as Map<String, dynamic>),
                toFirestore: (e, _) => e.toJson(),
              ),
          getObjectId: (e) => e.id,
          setObjectId: (e, id) => e.copyWith(id: id),
        );

  Future<MResult<List<MProduct>>> getProducts({
    List<MProductFilter> filters = const [MProductFilter.news],
    DocumentSnapshot<MProduct>? lastDocument,
    int limit = 5,
  }) async {
    return await paginateQuery(
      queryBuilder: (q) {
        for (var filter in filters) {
          q = filter.applyQuery(q);
        }
        return q;
      },
      lastDocument: lastDocument,
      limit: limit,
    );
  }

  Future<MResult<List<DocumentSnapshot<MProduct>>>> getProducts1({
    List<MProductFilter> filters = const [MProductFilter.news],
    DocumentSnapshot<MProduct>? lastDocument,
    int limit = 5,
  }) async {
    return await paginateQuery1(
      queryBuilder: (q) {
        for (var filter in filters) {
          q = filter.applyQuery(q);
        }
        return q;
      },
      lastDocument: lastDocument,
      limit: limit,
    );
  }

  Future<MResult<MProduct>> getOrAddProduct(MProduct product) async {
    try {
      final result = await get(product.id);
      if (result.isError == false) {
        return result;
      } else {
        final MResult<MProduct> newResult =
            await set(product.copyWith(id: ref.doc().id)); // update id
        return MResult.success(newResult.data);
      }
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<List<MProduct>>> getProductsByCategoryId(
      String categoryId) async {
    try {
      return await query(((q) => q.where('idCategory', isEqualTo: categoryId)));
    } catch (e) {
      return MResult.exception(e);
    }
  }
}
