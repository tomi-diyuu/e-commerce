import 'package:e_commerce/src/network/data/cart/cart_reference.dart';
import 'package:e_commerce/src/network/data/cart/cart_repository.dart';
import 'package:e_commerce/src/network/model/cart/cart.dart';
import 'package:e_commerce/src/network/model/cart/cart_item.dart';
import 'package:e_commerce/src/network/model/common/result.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CartRepositoryImpl implements CartRepository {
  final cartRef = CartReference();

  @override
  Future<MResult<MCart>> getOrAddCart(String userId) async {
    return await cartRef.getOrAddCart(MCart(userId: userId));
  }

  @override
  Future<MResult<MCart>> addToCart(String userId, MCartItem item) async {
    final result = await cartRef.get(userId);
    if (result.isSuccess) {
      final cart = result.data!;
      final List<MCartItem> updatedItems = List.from(cart.items)..add(item);
      final newCart = cart.copyWith(items: updatedItems).updateTotalPrice();
      await cartRef.updateCart(newCart);
      return MResult.success(newCart);
    } else {
      return MResult.error("Cart not found!");
    }
  }

  @override
  Future<MResult<MCart>> updateCart(MCart cart) async {
    return await cartRef.updateCart(cart);
  }

  @override
  Future<MResult<MCart>> removeItem(String userId, String itemId) async {
    final result = await cartRef.get(userId);
    if (result.isSuccess) {
      final cart = result.data!;

      final List<MCartItem> updatedItems = List.from(cart.items)
        ..removeWhere((item) => item.id == itemId);
      final newCart = cart.copyWith(items: updatedItems).updateTotalPrice();
      await cartRef.updateCart(newCart);
      return MResult.success(newCart);
    } else {
      return MResult.error("Cart not found!");
    }
  }
}
