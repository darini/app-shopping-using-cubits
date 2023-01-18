part of 'cart_cubit.dart';

class CartState extends Equatable {
  final List<CartModel> data;
  final double total;

  const CartState._({
    this.data = const [],
    this.total = 0,
  });

  const CartState.changeCart({
    required List<CartModel> cart,
    required double total,
  }) : this._(
          data: cart,
          total: total,
        );

  @override
  List<Object?> get props => [data, total];
}
