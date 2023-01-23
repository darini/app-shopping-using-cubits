import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping2/domain/categories/models/category_model.dart';
import 'package:shopping2/domain/categories/repositories/category_repository_interface.dart';
import 'package:shopping2/util/constants.dart';

@Singleton(as: ICategoryRepository)
class CategoryRepository implements ICategoryRepository {
  @override
  Future<List<CategoryModel>> getAll() async {
    var url = '${apiUrl}v1/categories';

    Response response = await Dio().get(url);

    return (response.data as List)
        .map((course) => CategoryModel.fromJson(course))
        .toList();
  }
}
