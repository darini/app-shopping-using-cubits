import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping2/domain/cart/models/cart_model.dart';
import 'package:shopping2/domain/products/models/product_model.dart';
import 'package:shopping2/ui/cart/cubits/cart_cubit.dart';

class AddToCart extends StatelessWidget {
  final ProductModel item;

  const AddToCart({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool itemInCart = false;

    CartModel cartItem = CartModel(
      id: item.id,
      image: item.image,
      price: item.price,
      quantity: 1,
      title: item.title,
    );

    return BlocBuilder<CartCubit, CartState>(
      builder: (_, state) {
        return SizedBox(
          width: 80,
          height: 40,
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: !context.read<CartCubit>().itemInCart(cartItem)
                  ? MaterialStateProperty.all(Theme.of(context).primaryColor)
                  : MaterialStateProperty.all(Colors.red),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
            child: Icon(
              !context.read<CartCubit>().itemInCart(cartItem)
                  ? Icons.add_shopping_cart
                  : Icons.remove_shopping_cart,
            ),
            onPressed: () {
              if (!context.read<CartCubit>().itemInCart(cartItem)) {
                context.read<CartCubit>().add(cartItem);
                final snackBar = SnackBar(
                  content: Text('${item.title} adicionado'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else {
                context.read<CartCubit>().remove(cartItem);
                final snackBar = SnackBar(
                  content: Text('${item.title} removido'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
          ),
        );
      },
    );
  }
}
