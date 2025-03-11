import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/network/model/product/product.dart';

enum MProductFilter {
  sale(fieldName: 'discount'),
  news(fieldName: 'isNew'),
  featured(fieldName: 'isFeatured');

  const MProductFilter({this.fieldName});

  final String? fieldName;

  String get field => fieldName ?? "";
}

extension ProductFilterX on MProductFilter {
  bool apply(MProduct product) {
    switch (this) {
      case MProductFilter.sale:
        return product.discount > 0;
      case MProductFilter.news:
        return product.isNew == true;
      case MProductFilter.featured:
        return product.isFeatured == true;
    }
  }

  Query<MProduct> applyQuery(Query<MProduct> query) {
    switch (this) {
      case MProductFilter.sale:
        return query.where(field, isGreaterThan: 0);
      case MProductFilter.news:
        return query.where(field, isEqualTo: true);
      case MProductFilter.featured:
        return query.where(field, isEqualTo: true);
    }
  }

  Iterable<MProduct> applyAll(Iterable<MProduct> products) {
    return products.where(apply);
  }
}
