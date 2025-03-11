part of 'cart_cubit.dart';



final class CartState extends Equatable {
  const CartState(
      {this.cart = const MCart(userId: ''), this.status = MStatus.initial});

  final MCart cart;
  final MStatus status;

  @override
  List<Object> get props => [cart, status];

  factory CartState.ds() {
    final currentUser = UserPrefs.I.getUser();
    return CartState(
        cart: currentUser!.id.isNotEmpty
            ? MCart(userId: currentUser.id)
            : MCart.empty());
  }

  factory CartState.logout() {
    return CartState(cart: MCart.empty(), status: MStatus.initial);
  }

  CartState copyWith({MCart? cart, MStatus? status}) {
    return CartState(cart: cart ?? this.cart, status: status ?? this.status);
  }
}
