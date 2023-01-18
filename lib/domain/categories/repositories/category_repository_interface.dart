import 'package:shopping2/domain/categories/models/category_model.dart';

abstract class ICategoryRepository {
  Future<List<CategoryModel>> getAll();
}
