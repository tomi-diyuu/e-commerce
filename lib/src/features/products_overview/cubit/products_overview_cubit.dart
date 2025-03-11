import 'package:bloc/bloc.dart';
import 'package:e_commerce/src/network/domain_manager.dart';
import 'package:e_commerce/src/network/model/common/status.dart';
import 'package:e_commerce/src/network/model/product/product.dart';
import 'package:e_commerce/src/network/model/product/product_sort.dart';
import 'package:equatable/equatable.dart';

part 'products_overview_state.dart';

class ProductsOverviewCubit extends Cubit<ProductsOverviewState> {
  ProductsOverviewCubit() : super(ProductsOverviewState());
  final _dommain = DomainManager();

  Future onFetched(String id) async {
    emit(state.copyWith(status: MStatus.loading));
    final result = await _dommain.product.getProductsByCategoryId(id);

    if (result.isSuccess) {
      emit(state.copyWith(products: result.data, status: MStatus.success));
    } else {
      emit(state.copyWith(status: MStatus.failure));
    }
  }

  void onChangeLayout() {
    final newLayout =
        state.layout.isList ? MSliverLayout.grid : MSliverLayout.list;
    emit(state.copyWith(layout: newLayout));
  }

  void onChangeSorter(MProductSort sorter) {
    emit(state.copyWith(sorter: sorter));
  }
}
