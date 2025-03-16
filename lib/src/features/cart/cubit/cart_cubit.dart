import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/src/features/account/bloc/account_bloc.dart';
import 'package:e_commerce/src/network/domain_manager.dart';
import 'package:e_commerce/src/network/model/cart/cart.dart';
import 'package:e_commerce/src/network/model/cart/cart_item.dart';
import 'package:e_commerce/src/network/model/common/status.dart';
import 'package:e_commerce/src/network/model/promotion/promotion.dart';
import 'package:e_commerce/src/services/user_prefs.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState.ds()) {
    onSubscriptionRequested();
    _listenToAuthChanges();
  }

  final _domain = DomainManager();
  bool _hasPendingChanges =
      false; // kiểm tra số lượng các item trong cart có thay đổi k
  late StreamSubscription
      _authSubscription; // lắng nghe account bloc thay đổi sự kiện

  void onSubscriptionRequested() async {
    emit(state.copyWith(status: MStatus.loading));
    String cartId = state.cart.userId;

    if (cartId.isNotEmpty) {
      final result = await _domain.cart.getOrAddCart(cartId);
      if (result.isSuccess) {
        emit(state.copyWith(cart: result.data!, status: MStatus.success));
      }
    }
  }

  void _onReset() {
    emit(CartState.logout());
  }

  void _onReload() {
    emit(CartState.ds());
    onSubscriptionRequested();
  }

  void onCartChanged(CartState newState) {
    emit(newState);
  }

  void applyPromotion(MPromotion? promotion) {
    final resetCart = state.cart.updateTotalPrice(newPromo: 0);
    if (promotion != null) {
      final updatedCart = resetCart.updateTotalPrice(
          newPromo: (promotion.discountPercentageValue! * resetCart.totalPrice)
              .toInt());
      emit(state.copyWith(cart: updatedCart));
    } else {
      // remove promotion is applying on cart
      emit(state.copyWith(cart: resetCart));
    }
  }

  void addToCart(MCartItem newItem) async {
    if (state.status.isLoading || state.status.isInitial) return;
    emit(state.copyWith(status: MStatus.loading));

    final updatedItems = List<MCartItem>.from(state.cart.items);
    final index = updatedItems.indexWhere((item) => item.id == newItem.id);

    if (index != -1) {
      final cur = updatedItems[index];
      updatedItems[index] =
          cur.updateQuantity(cur.quantity + 1); // tăng số lượng
      _hasPendingChanges = true;
    } else {
      updatedItems.add(newItem.updateQuantity(1));
      _hasPendingChanges = true;
    }
    final updatedCart = state.cart
        .copyWith(items: updatedItems)
        .updateTotalPrice(); // Tính lại tổng tiền giỏ hàng
    onCartChanged(state.copyWith(cart: updatedCart, status: MStatus.success));
  }

  void removeItem(String itemId) async {
    if (state.status.isLoading || state.status.isInitial) return;
    emit(state.copyWith(status: MStatus.loading));

    final updatedItems = List<MCartItem>.from(state.cart.items);
    final index = updatedItems.indexWhere((item) => item.id == itemId);

    if (index != -1) {
      updatedItems.removeAt(index);

      final updatedCart =
          state.cart.copyWith(items: updatedItems).updateTotalPrice();
      _hasPendingChanges = true;
      emit(state.copyWith(cart: updatedCart, status: MStatus.success));
    } else {
      emit(state.copyWith(status: MStatus.failure));
    }
  }

  void increaseQuantity(String id) {
    if (state.status.isLoading || state.status.isInitial) return;
    final updatedItems = List<MCartItem>.from(state.cart.items);
    final index = updatedItems.indexWhere((item) => item.id == id);

    final currentItem = updatedItems[index];

    updatedItems[index] = currentItem.updateQuantity(currentItem.quantity + 1);

    final updatedCart =
        state.cart.copyWith(items: updatedItems).updateTotalPrice();
    _hasPendingChanges = true;
    emit(state.copyWith(cart: updatedCart, status: MStatus.success));
  }

  void decreaseQuantity(String id) {
    if (state.status.isLoading || state.status.isInitial) return;
    final updatedItems = List<MCartItem>.from(state.cart.items);
    final index = updatedItems.indexWhere((item) => item.id == id);

    final currentItem = updatedItems[index];
    if (currentItem.quantity == 1) {
      removeItem(id);
      return;
    }

    updatedItems[index] = currentItem.updateQuantity(currentItem.quantity - 1);

    final updatedCart = state.cart
        .copyWith(items: updatedItems)
        .updateTotalPrice(); // cập nhật lại tổng tiền đơn khi item price thay đổi
    _hasPendingChanges = true;
    emit(state.copyWith(cart: updatedCart));
  }

  void _listenToAuthChanges() {
    _authSubscription = GetIt.I<AccountBloc>().stream.listen((accountState) {
      if (accountState.isLogin) {
        _onReload();
      } else {
        _onReset();
      }
    });
  }

  Future<void> syncCartToServer() async {
    if (!_hasPendingChanges) return;
    final result = await _domain.cart.updateCart(state.cart);
    if (result.isSuccess) {
      _hasPendingChanges = false; // Reset trạng thái sau khi cập nhật
    } else {
      _hasPendingChanges = true;
    }
  }

  @override
  Future<void> close() {
    _authSubscription.cancel();
    return super.close();
  }

  Future<void> onChanged(CartState newState) async {
    emit(newState);
  }
}
