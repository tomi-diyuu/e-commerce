part of 'new_products_cubit.dart';

final class NewProductsState extends Equatable {
  const NewProductsState(
      {this.newProducts = const [], this.status = MStatus.initial});

  final List<MProduct> newProducts;
  final MStatus status;

  @override
  List<Object> get props => [newProducts, status];

  NewProductsState copyWith({List<MProduct>? newProducts, MStatus? status}) {
    return NewProductsState(
        newProducts: newProducts ?? this.newProducts,
        status: status ?? this.status);
  }
}
