part of 'product_cubit.dart';

class ProductState extends BaseFetchState<ProductModel> {
  final String selectedCategory;

  String get getSelectedCategory => selectedCategory;

  const ProductState(this.selectedCategory) : super.initial();

  const ProductState.initial(
    this.selectedCategory,
  ) : super.initial();

  const ProductState.loading(
    this.selectedCategory,
  ) : super.loading();

  const ProductState.loaded(
    this.selectedCategory, {
    required List<ProductModel> products,
  }) : super.loaded(
          data: products,
        );
}
