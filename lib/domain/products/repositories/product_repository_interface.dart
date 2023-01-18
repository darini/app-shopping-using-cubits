import 'package:shopping2/domain/products/models/product_model.dart';

abstract class IProductRepository {
  Future<List<ProductModel>> getAll({String category});

  Future<ProductModel> getByTag(String tag);
}
