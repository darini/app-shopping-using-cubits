import 'package:dio/dio.dart';
import 'package:shopping2/domain/products/models/product_model.dart';
import 'package:shopping2/domain/products/repositories/product_repository_interface.dart';
import 'package:shopping2/util/constants.dart';

class ProductRepository implements IProductRepository {
  @override
  Future<List<ProductModel>> getAll({String? category}) async {
    var url = category == null
        ? '${apiUrl}v1/products'
        : '${apiUrl}v1/categories/$category/products';

    Response response = await Dio().get(url);

    return (response.data as List)
        .map((course) => ProductModel.fromJson(course))
        .toList();
  }

  @override
  Future<ProductModel> getByTag(String tag) async {
    var url = '${apiUrl}v1/products/$tag';

    Response response = await Dio().get(url);

    return ProductModel.fromJson(response.data);
  }
}
