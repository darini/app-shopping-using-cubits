import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping2/domain/products/models/product_model.dart';
import 'package:shopping2/ui/products/cubits/product_cubit.dart';

class ProductPage extends StatelessWidget {
  final String tag;

  const ProductPage({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      buildWhen: (previous, current) => previous.product != current.product,
      builder: (context, state) {
        if (state.isLoading) {
          return Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state.product == null) {
          return Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: Text('Nenhuma imagem encontrada para o produto escolhido'),
            ),
          );
        }
        return content(state.product!);
      },
    );
  }

  Widget content(ProductModel product) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: product.images?.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 200,
            child: Image.network(product.images![index]!),
          );
        },
      ),
    );
  }
}
