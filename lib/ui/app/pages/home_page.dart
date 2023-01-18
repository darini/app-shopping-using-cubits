import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping2/ui/app/widgets/my_snackBar.dart';
import 'package:shopping2/ui/categories/cubits/category_cubit.dart';
import 'package:shopping2/ui/categories/widgets/category_list.widget.dart';
import 'package:shopping2/ui/products/cubits/product_cubit.dart';
import 'package:shopping2/ui/products/widgets/product_list.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void showSnackBarError(String? message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(MySackBar.error(message: message));
  }

  void showSnackBarSuccess(String? message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(MySackBar.success(message: message));
  }

  @override
  Widget build(BuildContext context) {
    context.read<CategoryCubit>().getAll();
    context.read<ProductCubit>().getAll();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: MultiBlocListener(
          listeners: [
            BlocListener<CategoryCubit, CategoryState>(
              listenWhen: (previous, current) => current.hasMessage,
              listener: (_, state) => showSnackBarError(
                state.message,
              ),
            ),
            BlocListener<ProductCubit, ProductState>(
              listenWhen: (previous, current) => current.hasMessage,
              listener: (_, state) => showSnackBarError(
                state.message,
              ),
            ),
          ],
          child: ListView(
            children: <Widget>[
              const SizedBox(
                height: 60,
              ),
              const Text(
                'Categorias',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<CategoryCubit, CategoryState>(
                buildWhen: (previous, current) => previous.data != current.data,
                builder: (context, state) {
                  return CategoryList(
                    categories: state.data,
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Mais Vendidos',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<ProductCubit, ProductState>(
                buildWhen: (previous, current) => previous.data != current.data,
                builder: (context, state) {
                  return ProductList(
                    products: state.data,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
