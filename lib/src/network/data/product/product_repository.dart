import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/network/model/common/result.dart';
import 'package:e_commerce/src/network/model/product/product.dart';
import 'package:e_commerce/src/network/model/product/product_filter.dart';

abstract class ProductRepository {
  Future<MResult<List<MProduct>>> getProducts(
      {List<MProductFilter> filters = const [MProductFilter.news]});

  Future<MResult<MProduct>> getOrAddProduct(MProduct product);

  Future<MResult<List<MProduct>>> getProductsByCategoryId(String categoryId);

  Future<MResult<List<DocumentSnapshot<MProduct>>>> getNextProductsFilter(
      {List<MProductFilter> filters = const [MProductFilter.news]});
}
