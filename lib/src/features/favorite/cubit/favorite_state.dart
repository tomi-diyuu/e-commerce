part of 'favorite_cubit.dart';

final class FavoriteState<T> extends PaginateState<T> {
  const FavoriteState(super.docs);

  @override
  List<Object> get props => [docs];

  List<MProduct> get items => ((docs.data as List<DocumentSnapshot>?) ?? [])
      .map((e) => e.data() as MProduct)
      .toList();

  @override
  FavoriteState<T> copyWithItem(
    XPaginate<T> docs,
  ) {
    return FavoriteState(
      docs,
    );
  }
}
