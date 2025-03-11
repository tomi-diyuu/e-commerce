import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/network/data/product/product_reference.dart';
import 'package:e_commerce/src/network/data/product/product_repository.dart';
import 'package:e_commerce/src/network/data/user/user_reference.dart';
import 'package:e_commerce/src/network/model/common/result.dart';
import 'package:e_commerce/src/network/model/product/product.dart';
import 'package:e_commerce/src/network/model/product/product_filter.dart';

class ProductRepositoryImpl implements ProductRepository {
  final productRef = ProductReference();
  final userRef = UserReference();

  @override
  Future<MResult<List<MProduct>>> getProducts({
    List<MProductFilter> filters = const [MProductFilter.news],
  }) async {
    return await productRef.getProducts(filters: filters);
  }

  @override
  Future<MResult<MProduct>> getOrAddProduct(MProduct product) {
    return productRef.getOrAddProduct(product);
  }

  @override
  Future<MResult<List<MProduct>>> getProductsByCategoryId(
      String categoryId) async {
    return await productRef.getProductsByCategoryId(categoryId);
  }

  @override
  Future<MResult<List<DocumentSnapshot<MProduct>>>> getNextProductsFilter({
    List<MProductFilter> filters = const [MProductFilter.news],
    DocumentSnapshot<MProduct>? lastDocument,
    int limit = 5,
  }) async {
    return await productRef.getProducts1(
        filters: filters, lastDocument: lastDocument, limit: limit);
  }

 
}
