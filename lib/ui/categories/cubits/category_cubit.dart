import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping2/domain/categories/repositories/category_repository_interface.dart';
import 'package:shopping2/ui/app/cubits/base_fetch_cubit.dart';
import 'package:shopping2/domain/categories/models/category_model.dart';

part 'category_state.dart';

@singleton
class CategoryCubit extends Cubit<CategoryState> {
  final ICategoryRepository _categoryRepository;

  CategoryCubit(this._categoryRepository)
      : super(
          const CategoryState.initial(),
        );

  void getAll() async {
    emit(const CategoryState.loading());

    _categoryRepository.getAll().then((data) {
      emit(
        CategoryState.loaded(
          categories: data,
        ),
      );
    });
  }
}
