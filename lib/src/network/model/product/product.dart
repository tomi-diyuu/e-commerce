import 'package:e_commerce/src/network/model/common/json_map.dart';
import 'package:e_commerce/src/network/model/product/variant.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class MProduct with _$MProduct {
  const MProduct._();
  @JsonSerializable(explicitToJson: true)
  const factory MProduct(
      {required String id,
      String? name,
      String? descriptipn,
      int? oldPrice,
      int? newPrice,
      String? image,
      double? avgRating,
      @Default(0) int numbOfRating,
      @Default(false) bool isNew,
      @Default(false) bool isFeatured,
      @Default(0) double discount,
      String? idCategory,
      List<MVariant>? variants}) = _MProduct;

  factory MProduct.fromJson(JsonMap json) => _$MProductFromJson(json);

  List<String> get sizes =>
      variants
          ?.map((variant) => variant.size)
          .whereType<String>()
          .toSet()
          .toList() ??
      [];

  List<String> get colors =>
      variants
          ?.map((variant) => variant.color)
          .whereType<String>()
          .toSet()
          .toList() ??
      [];

  int? getPrice(int selectedSize, int selectedColor) {
    final variant = variants?.firstWhere(
      (v) => v.color == colors[selectedColor] && v.size == sizes[selectedSize],
      orElse: () => MVariant(id: "", price: null),
    );
    return variant?.price ?? newPrice;
  }
}
