part of 'cart_cubit.dart';

class CartState extends Equatable {
  final List<CartModel> cart;
  final double total;

  const CartState._({
    this.cart = const [],
    this.total = 0,
  });

  const CartState.changeCart({
    required List<CartModel> cart,
    required double total,
  }) : this._(
          cart: cart,
          total: total,
        );

  @override
  List<Object?> get props => [cart, total];
}
