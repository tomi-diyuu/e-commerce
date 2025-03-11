import 'package:e_commerce/src/network/model/common/json_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item.freezed.dart';
part 'cart_item.g.dart';

@freezed
class MCartItem with _$MCartItem {
  const MCartItem._();

  const factory MCartItem({
    required String id,
    required String productId,
    required String name,
    required int price,
    required String color,
    required String size,
    required String image,
    @Default(1) int quantity,
    @Default(0) int totalPrice,
  }) = _MCartItem;

  factory MCartItem.fromJson(JsonMap json) => _$MCartItemFromJson(json);

  MCartItem updateQuantity(int newQuantity) {
    return copyWith(quantity: newQuantity, totalPrice: price * newQuantity);
  }

  
}
