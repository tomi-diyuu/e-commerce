import 'package:bloc/bloc.dart';
import 'package:e_commerce/src/network/domain_manager.dart';
import 'package:e_commerce/src/network/model/common/status.dart';
import 'package:e_commerce/src/network/model/product/product.dart';
import 'package:e_commerce/src/network/model/product/product_filter.dart';
import 'package:equatable/equatable.dart';

part 'new_products_state.dart';

class NewProductsCubit extends Cubit<NewProductsState> {
  NewProductsCubit() : super(NewProductsState()) {
    loadNewProducts();
  }

  final _domain = DomainManager();

  void loadNewProducts() async {
    emit(state.copyWith(status: MStatus.loading));

    final result =
        await _domain.product.getProducts(filters: const [MProductFilter.news]);
    if (result.isSuccess) {
      emit(state.copyWith(newProducts: result.data, status: MStatus.success));
    } else {
      emit(state.copyWith(status: MStatus.failure));
    }
  }
}
