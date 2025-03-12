import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/features/account/bloc/account_bloc.dart';
import 'package:e_commerce/src/network/domain_manager.dart';
import 'package:e_commerce/src/network/model/common/result.dart';
import 'package:e_commerce/src/network/model/product/product.dart';
import 'package:e_commerce/widgets/paginate/cubit/paginate_cubit.dart';
import 'package:e_commerce/widgets/paginate/paginate.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

part 'favorite_state.dart';

class FavoriteCubit
    extends PaginateCubit<FavoriteState<DocumentSnapshot<MProduct>>> {
  FavoriteCubit() : super(FavoriteState(XPaginate.initial()));

  final _domain = DomainManager();

  @override
  Future<void> fetchFirstData() {
    emit(state.copyWithItem(XPaginate.initial()));
    return fetchNextData();
  }

  @override
  Future<void> fetchNextData() async {
    if (state.docs.canNext) {
      emit(
        state.copyWithItem(state.docs.loading()),
      );

      final value = await _domain.favorite.getNextFavoriteProducts(
          GetIt.I<AccountBloc>().state.user.id,
          lastDocument: state.docs.lastDoc);

      emit(state
          .copyWithItem(state.docs.result(MResult.success(value.data ?? []))));
    }
  }

  void removeItem(String productId) {
    // Lọc bỏ sản phẩm bị xoá khỏi danh sách
    final newDocs =
        state.docs.data?.where((e) => e.data()?.id != productId).toList() ?? [];

    // Phát trạng thái mới với danh sách đã cập nhật
    emit(state.copyWithItem(state.docs.copyWith(data: newDocs)));
  }
}
