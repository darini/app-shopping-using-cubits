import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping2/domain/categories/models/category_model.dart';
import 'package:shopping2/ui/app/widgets/loader.widget.dart';
import 'package:shopping2/ui/categories/cubits/category_cubit.dart';
import 'package:shopping2/ui/products/cubits/product_cubit.dart';
import 'category_card.widget.dart';

class CategoryList extends StatelessWidget {
  final List<CategoryModel>? categories;

  const CategoryList({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Loader(
        state: context.read<CategoryCubit>().state,
        callback: list,
      ),
    );
  }

  Widget list() {
    return ListView.builder(
      itemCount: categories?.length,
      itemBuilder: (context, index) {
        CategoryModel item = categories![index];

        return Padding(
          padding: const EdgeInsets.all(5),
          child: CategoryCard(item: item),
        );
      },
      scrollDirection: Axis.horizontal,
    );
  }
}
