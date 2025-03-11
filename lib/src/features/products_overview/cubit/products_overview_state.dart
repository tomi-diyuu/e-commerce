part of 'products_overview_cubit.dart';

enum MSliverLayout { list, grid }

extension SliverLayoutX on MSliverLayout {
  bool get isList => this == MSliverLayout.list;
  bool get isGrid => this == MSliverLayout.grid;
}

final class ProductsOverviewState extends Equatable {
  const ProductsOverviewState(
      {this.layout = MSliverLayout.list,
      this.products = const [],
      this.sorter = MProductSort.none,
      this.status = MStatus.initial})
      : super();

  final List<MProduct> products;
  final MProductSort sorter;
  final MStatus status;
  final MSliverLayout layout;

  List<MProduct> get sortedProducts => sorter.applyAll(products);

  @override
  List<Object> get props => [layout, products, sorter, status];

  ProductsOverviewState copyWith(
      {MSliverLayout? layout,
      List<MProduct>? products,
      MProductSort? sorter,
      MStatus? status}) {
    return ProductsOverviewState(
        layout: layout ?? this.layout,
        products: products ?? this.products,
        sorter: sorter ?? this.sorter,
        status: status ?? this.status);
  }
}
