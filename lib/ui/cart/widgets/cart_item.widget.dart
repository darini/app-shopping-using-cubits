import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shopping2/domain/cart/models/cart_model.dart';
import 'package:shopping2/ui/cart/cubits/cart_cubit.dart';

class CartItem extends StatelessWidget {
  final CartModel item;

  const CartItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final bloc = Provider.of<CartBloc>(context);
    final price = NumberFormat('#,##0.00', 'pt_BR');

    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return Container(
          height: 120,
          margin: const EdgeInsets.all(5),
          child: Row(
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.all(10),
                child: Image.network(
                  item.image!,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(item.title!),
                    Text(
                      'R\$ ${price.format(item.price)}',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('R\$ ${price.format((item.price! * item.quantity!))}'),
                    Container(
                      height: 30,
                      width: 120,
                      decoration: const BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 40,
                            alignment: Alignment.center,
                            child: TextButton(
                              child: const Text(
                                '-',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {
                                context.read<CartCubit>().decrease(item);
                              },
                            ),
                          ),
                          Container(
                            width: 40,
                            alignment: Alignment.center,
                            child: Text(
                              item.quantity.toString(),
                            ),
                          ),
                          Container(
                            width: 40,
                            alignment: Alignment.center,
                            child: TextButton(
                              child: const Text(
                                '+',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {
                                context.read<CartCubit>().increase(item);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
