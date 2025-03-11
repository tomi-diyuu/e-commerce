part of 'sale_products_cubit.dart';

final class SaleProductsState extends Equatable {
  const SaleProductsState(
      {this.saleProducts = const [], this.status = MStatus.initial});

  final List<MProduct> saleProducts;
  final MStatus status;

  @override
  List<Object> get props => [saleProducts, status];

  SaleProductsState copyWith(
      {List<MProduct>? saleProducts, MStatus? status}) {
    return SaleProductsState(
        saleProducts: saleProducts ?? this.saleProducts,
        status: status ?? this.status);
  }
}
