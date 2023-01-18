import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopping2/ui/app/pages/home_page.dart';
import 'package:shopping2/ui/cart/cubits/cart_cubit.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: <Widget>[
          const HomePage(),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.red,
          )
          //CartPage(),
          //const AccountPage(),
        ],
      ),
      bottomNavigationBar: TabBar(
        tabs: <Widget>[
          Tab(
            icon: Icon(
              Icons.home,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          BlocBuilder<CartCubit, CartState>(
              //listener: (context, state) => state.cart.length,
              //child:
              buildWhen: (previous, current) => previous != current,
              builder: (context, state) {
                return Tab(
                  icon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.shopping_cart,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.3),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Text(
                          context
                              .read<CartCubit>()
                              .state
                              .cart
                              .length
                              .toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              }),
          Tab(
            icon: Icon(
              Icons.perm_identity,
              color: Theme.of(context).iconTheme.color,
            ),
          )
        ],
        labelColor: Colors.blue,
        unselectedLabelColor: Colors.black38,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: const EdgeInsets.all(5.0),
        indicatorColor: Colors.blue,
      ),
    );
  }
}
