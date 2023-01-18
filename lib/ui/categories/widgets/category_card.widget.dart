import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping2/domain/categories/models/category_model.dart';
import 'package:shopping2/ui/categories/cubits/category_cubit.dart';
import 'package:shopping2/ui/products/cubits/product_cubit.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel? item;

  const CategoryCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) => Container(
        width: 70,
        height: 70,
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: item?.tag == state.selectedCategory
              ? Theme.of(context).primaryColor.withOpacity(0.3)
              : Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(70),
          ),
        ),
        child: TextButton(
          child: Image.asset('assets/categories/light/${item?.tag}.png'),
          onPressed: () {
            context.read<ProductCubit>().getByCategory(item?.tag);
          },
        ),
      ),
    );
  }
}
