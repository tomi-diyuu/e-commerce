import 'package:e_commerce/src/network/model/cart/cart.dart';
import 'package:e_commerce/src/network/model/cart/cart_item.dart';
import 'package:e_commerce/src/network/model/common/result.dart';

abstract class CartRepository {
  Future<MResult<MCart>> getOrAddCart(String userId);
  Future<MResult<MCart>> addToCart(String userId, MCartItem item);
  Future<MResult<MCart>> updateCart(MCart cart);
  Future<MResult<MCart>> removeItem(String userId, String itemId);
}
