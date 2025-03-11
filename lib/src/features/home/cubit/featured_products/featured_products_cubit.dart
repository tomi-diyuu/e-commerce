import 'package:bloc/bloc.dart';
import 'package:e_commerce/src/network/domain_manager.dart';
import 'package:e_commerce/src/network/model/common/status.dart';
import 'package:e_commerce/src/network/model/product/product.dart';
import 'package:e_commerce/src/network/model/product/product_filter.dart';
import 'package:equatable/equatable.dart';

part 'featured_products_state.dart';

class FeaturedProductsCubit extends Cubit<FeaturedProductsState> {
  FeaturedProductsCubit() : super(FeaturedProductsState()) {
    loadFeaturedProducts();
  }

  final _domain = DomainManager();

  void loadFeaturedProducts() async {
    emit(state.copyWith(status: MStatus.loading));

    final result = await _domain.product
        .getProducts(filters: const [MProductFilter.featured]);
    if (result.isSuccess) {
      emit(state.copyWith(
          featuredProducts: result.data,
          status: MStatus.success));
    } else {
      emit(state.copyWith(status: MStatus.failure));
    }
  }
}
