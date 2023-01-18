import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shopping2/domain/cart/models/cart_model.dart';
import 'package:shopping2/ui/app/widgets/loader.widget.dart';
import 'package:shopping2/ui/cart/cubits/cart_cubit.dart';
import 'package:shopping2/ui/cart/widgets/cart_item.widget.dart';

class CartPage extends StatelessWidget {
  final price = NumberFormat('#,##0.00', 'pt_BR');
  //List<CartModel> itens = [];

  CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //itens = [];
    //itens.addAll(context.read<CartCubit>().state.data);

    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return Scaffold(
          body: Container(
            padding: const EdgeInsets.only(
              top: 60,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: state.data.isEmpty
                      ? const Center(
                          child: Text('Nenhum item encontrado'),
                        )
                      : list(state.data),
                ),
                Container(
                  height: 80,
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'R\$ ${price.format(state.total)}',
                        style: const TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Checkout',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).primaryColor),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget list(List<CartModel> itens) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: itens.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(itens[index].id!),
          child: CartItem(item: itens[index]),
          onDismissed: (direction) {
            context.read<CartCubit>().remove(itens[index]);
          },
          background: Container(
            color: Colors.red.withOpacity(0.1),
          ),
        );
      },
    );
  }
}
