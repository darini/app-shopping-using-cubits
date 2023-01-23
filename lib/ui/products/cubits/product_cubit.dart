import 'package:injectable/injectable.dart';
import 'package:shopping2/domain/products/models/product_model.dart';
import 'package:shopping2/domain/products/repositories/product_repository_interface.dart';
import 'package:shopping2/ui/app/cubits/base_fetch_cubit.dart';
import 'package:shopping2/ui/app/enums/enums.dart';

part 'product_state.dart';

@singleton
class ProductCubit extends BaseFetchCubit<ProductState> {
  final IProductRepository _productRepository;

  ProductCubit(
    this._productRepository,
  ) : super(const ProductState.initial('todos'));

  @override
  void getAll() async {
    emit(const ProductState.loading('todos'));

    _productRepository.getAll().then((data) {
      emit(ProductState.loaded(
        'todos',
        products: data,
      ));
    });
  }

  void getByCategory(String? category) async {
    emit(const ProductState.loading('todos'));

    _productRepository.getAll(category: category!).then((data) {
      emit(ProductState.loaded(category, products: data));
    });
  }

  void getByTag(String tag) async {
    List<ProductModel> _products = [];

    _products.addAll(state.data);

    emit(ProductState.loading(
      state.selectedCategory,
    ));

    ProductModel _product = await _productRepository.getByTag(tag);

    emit(ProductState.loaded(state.selectedCategory,
        products: _products, product: _product));
  }
}
