import 'package:bloc/bloc.dart';
import 'package:e_commerce/src/network/domain_manager.dart';
import 'package:e_commerce/src/network/model/common/status.dart';
import 'package:e_commerce/src/network/model/product/product.dart';
import 'package:e_commerce/src/network/model/product/product_filter.dart';
import 'package:equatable/equatable.dart';

part 'sale_products_state.dart';

class SaleProductsCubit extends Cubit<SaleProductsState> {
  SaleProductsCubit() : super(SaleProductsState()) {
    loadSaleProducts();
  }

  final _domain = DomainManager();

  void loadSaleProducts() async {
    emit(state.copyWith(status: MStatus.loading));

    final result =
        await _domain.product.getProducts(filters: const [MProductFilter.sale]);
    if (result.isSuccess) {
      emit(state.copyWith(saleProducts: result.data, status: MStatus.success));
    } else {
      emit(state.copyWith(status: MStatus.failure));
    }
  }
}
