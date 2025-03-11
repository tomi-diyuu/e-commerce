part of 'paginate_view_all_cubit.dart';

class PaginateViewAllState<T> extends PaginateState<T> {
  const PaginateViewAllState(super.docs, {required this.productType});
  final MProductFilter productType;

  @override
  List<Object?> get props => [docs, productType];

  @override
  PaginateViewAllState<T> copyWithItem(XPaginate<T> docs,
      {MProductFilter? productType}) {
    return PaginateViewAllState(docs,
        productType: productType ?? this.productType);
  }
}
