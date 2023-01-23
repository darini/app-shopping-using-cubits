part of 'product_cubit.dart';

class ProductState extends BaseFetchState<ProductModel> {
  final String selectedCategory;
  final ProductModel? product;

  String get getSelectedCategory => selectedCategory;

  const ProductState(this.selectedCategory, {this.product}) : super.initial();

  const ProductState.initial(
    this.selectedCategory, {
    this.product,
  }) : super.initial();

  const ProductState.loading(
    this.selectedCategory, {
    this.product,
  }) : super.loading();

  const ProductState.loaded(
    this.selectedCategory, {
    required List<ProductModel> products,
    this.product,
  }) : super.loaded(
          data: products,
        );
}
