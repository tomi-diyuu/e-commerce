import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/network/domain_manager.dart';
import 'package:e_commerce/src/network/model/common/result.dart';
import 'package:e_commerce/src/network/model/product/product.dart';
import 'package:e_commerce/src/network/model/product/product_filter.dart';
import 'package:e_commerce/widgets/paginate/cubit/paginate_cubit.dart';
import 'package:e_commerce/widgets/paginate/paginate.dart';

part 'paginate_view_all_state.dart';

class PaginateViewAllCubit
    extends PaginateCubit<PaginateViewAllState<DocumentSnapshot<MProduct>>> {
  PaginateViewAllCubit()
      : super(PaginateViewAllState(XPaginate.initial(),
            productType: MProductFilter.sale));

  final _domain = DomainManager();

  @override
  Future<void> fetchFirstData() async {
    emit(state.copyWithItem(XPaginate.initial()));
    return fetchNextData();
  }

  @override
  Future<void> fetchNextData() async {
    if (state.docs.canNext) {
      emit(
        state.copyWithItem(state.docs.loading()),
      );

      final value = await _domain.product.getNextProductsFilter(
          filters: [state.productType], lastDocument: state.docs.lastDoc);

      emit(state
          .copyWithItem(state.docs.result(MResult.success(value.data ?? []))));
    }
  }

  void onChangeProductFilter(MProductFilter filter) {
    emit(state.copyWithItem(XPaginate.initial(), productType: filter));
  }
}
