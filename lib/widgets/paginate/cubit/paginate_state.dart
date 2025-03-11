part of 'paginate_cubit.dart';

class PaginateState<T> extends Equatable {
  final XPaginate<T> docs;

  const PaginateState(this.docs);

  @override
  List<Object?> get props => [docs];
  // Sử dụng khi load xong 1 trang
  PaginateState copyWithItem(XPaginate<T> docs) {
    return PaginateState(
      docs,
    );
  }
}
