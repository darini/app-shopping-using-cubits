import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping2/domain/cart/models/cart_model.dart';

part 'cart_state.dart';

@singleton
class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState._());

  calculateTotal(List<CartModel> cart) {
    double total = 0;

    for (var element in cart) {
      total += (element.price! * element.quantity!);
    }

    emit(CartState.changeCart(cart: cart, total: total));
  }

  add(CartModel item) {
    List<CartModel> cart = [];

    cart.addAll(state.data);
    cart.add(item);

    calculateTotal(cart);
  }

  remove(CartModel item) {
    List<CartModel> cart = [];

    cart.addAll(state.data);
    cart.removeWhere((element) => element.id == item.id);
    calculateTotal(cart);
  }

  bool itemInCart(CartModel item) {
    var result = false;
    List<CartModel> cart = [];

    cart.addAll(state.data);

    for (var element in cart) {
      if (element.id == item.id) {
        result = true;
        break;
      }
    }

    return result;
  }

  increase(CartModel item) {
    List<CartModel> cart = [];

    cart.addAll(state.data);
    if (item.quantity! < 10) {
      item.quantity = item.quantity! + 1;
      calculateTotal(cart);
    }
  }

  decrease(CartModel item) {
    List<CartModel> cart = [];

    cart.addAll(state.data);
    if (item.quantity! > 1) {
      item.quantity = item.quantity! - 1;
      calculateTotal(cart);
    }
  }
}
