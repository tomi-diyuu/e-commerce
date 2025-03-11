part of 'product_detail_cubit.dart';

final class ProductDetailState extends Equatable {
  const ProductDetailState(
      {this.selectedImageIndex = 0,
      this.selectedColor = 0,
      this.selectedSize = 0});

  final int selectedImageIndex;
  final int selectedColor;
  final int selectedSize;

  @override
  List<Object> get props => [selectedImageIndex, selectedColor, selectedSize];

  ProductDetailState copyWith(
      {int? selectedImageIndex, int? selectedColor, int? selectedSize}) {
    return ProductDetailState(
        selectedImageIndex: selectedImageIndex ?? this.selectedImageIndex,
        selectedColor: selectedColor ?? this.selectedColor,
        selectedSize: selectedSize ?? this.selectedSize);
  }
}
