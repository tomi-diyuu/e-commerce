import 'package:e_commerce/src/network/model/cart/cart_item.dart';
import 'package:e_commerce/src/network/model/common/json_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
class MCart with _$MCart {
  const MCart._();
  @JsonSerializable(explicitToJson: true)
  const factory MCart({
    required String userId,
    @Default([]) List<MCartItem> items,
    @Default(0) int totalPrice,
    @Default(0) int promo,
  }) = _MCart;

  factory MCart.empty() {
    return MCart(userId: '');
  }

  factory MCart.fromJson(JsonMap json) => _$MCartFromJson(json);

  MCart updateTotalPrice({int? newPromo}) {
    int sumItemPrice = items.fold(0, (sum, item) => sum + item.totalPrice);
    int newTotal = sumItemPrice - (newPromo ?? promo);
    return copyWith(
      totalPrice: newTotal >= 0 ? newTotal : 0,
      promo: newPromo ?? promo,
    );
  }

  int get itemLength => items.length;

  String getExistedId(MCartItem newItem) {
    var existingItem = items.firstWhere(
      (item) =>
          item.productId == newItem.productId &&
          item.color == newItem.color &&
          item.size == newItem.size,
      orElse: () => MCartItem(
          id: '',
          productId: '',
          name: '',
          price: 0,
          color: '',
          size: '',
          image: ''),
    );
    return existingItem.id.isNotEmpty ? existingItem.id : Uuid().v4();
  }
}
