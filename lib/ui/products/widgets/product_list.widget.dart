import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping2/domain/products/models/product_model.dart';
import 'package:shopping2/ui/app/widgets/loader.widget.dart';
import 'package:shopping2/ui/products/cubits/product_cubit.dart';
import 'product_card.widget.dart';

class ProductList extends StatelessWidget {
  final List<ProductModel>? products;

  const ProductList({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 410,
      child: Loader(
        state: context.read<ProductCubit>().state,
        callback: list,
      ),
    );
  }

  Widget list() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: products?.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(5),
          child: ProductCard(
            item: products![index],
          ),
        );
      },
    );
  }
}
