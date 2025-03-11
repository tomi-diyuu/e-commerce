import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit() : super(ProductDetailState());

  void onSelectedImageIndexChanged(int index) {
    emit(state.copyWith(selectedImageIndex: index));
  }

  void onSelectedColorIndexChanged(int index) {
    emit(state.copyWith(selectedColor: index));
  }

  void onSelectedSizeIndexChanged(int index) {
    emit(state.copyWith(selectedSize: index));
  }
}
