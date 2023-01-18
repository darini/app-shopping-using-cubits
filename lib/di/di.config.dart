// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../domain/categories/repositories/category_repository_interface.dart'
    as _i4;
import '../domain/products/repositories/product_repository_interface.dart'
    as _i6;
import '../ui/categories/cubits/category_cubit.dart' as _i3;
import '../ui/products/cubits/product_cubit.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt init(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.CategoryCubit>(
      () => _i3.CategoryCubit(get<_i4.ICategoryRepository>()));
  gh.lazySingleton<_i5.ProductCubit>(
      () => _i5.ProductCubit(get<_i6.IProductRepository>()));
  return get;
}
