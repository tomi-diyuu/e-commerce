part of 'featured_products_cubit.dart';



final class FeaturedProductsState extends Equatable {
  const FeaturedProductsState(
      {this.featuredProducts = const [],
      this.status = MStatus.initial});

  final List<MProduct> featuredProducts;
  final MStatus status;

  @override
  List<Object> get props => [featuredProducts, status];

  FeaturedProductsState copyWith(
      {List<MProduct>? featuredProducts, MStatus? status}) {
    return FeaturedProductsState(
        featuredProducts: featuredProducts ?? this.featuredProducts,
        status: status ?? this.status);
  }
}
