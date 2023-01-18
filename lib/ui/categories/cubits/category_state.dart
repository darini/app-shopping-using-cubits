part of 'category_cubit.dart';

class CategoryState extends BaseFetchState<CategoryModel> {
  const CategoryState() : super.initial();

  const CategoryState.initial() : super.initial();
  const CategoryState.loading() : super.loading();

  const CategoryState.loaded({
    required List<CategoryModel> categories,
  }) : super.loaded(
          data: categories,
        );
}
