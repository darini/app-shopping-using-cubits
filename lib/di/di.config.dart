// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/repository/account_repository.dart' as _i5;
import '../data/repository/category_repository.dart' as _i7;
import '../data/repository/product_repository.dart' as _i9;
import '../domain/account/repositories/account_repository_interface.dart'
    as _i4;
import '../domain/categories/repositories/category_repository_interface.dart'
    as _i6;
import '../domain/products/repositories/product_repository_interface.dart'
    as _i8;
import '../ui/account/auth/cubits/auth_cubit.dart' as _i12;
import '../ui/account/cubits/account_cubit.dart' as _i11;
import '../ui/cart/cubits/cart_cubit.dart' as _i3;
import '../ui/categories/cubits/category_cubit.dart' as _i13;
import '../ui/products/cubits/product_cubit.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt init(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.CartCubit>(() => _i3.CartCubit());
  gh.lazySingleton<_i4.IAccountRepository>(() => _i5.AccountRepository());
  gh.lazySingleton<_i6.ICategoryRepository>(() => _i7.CategoryRepository());
  gh.lazySingleton<_i8.IProductRepository>(() => _i9.ProductRepository());
  gh.lazySingleton<_i10.ProductCubit>(
      () => _i10.ProductCubit(get<_i8.IProductRepository>()));
  gh.singleton<_i11.AccountCubit>(
      _i11.AccountCubit(get<_i4.IAccountRepository>()));
  gh.singleton<_i12.AuthCubit>(_i12.AuthCubit(get<_i4.IAccountRepository>(),
      get<_i11.AccountCubit>(), get<_i3.CartCubit>()));
  gh.lazySingleton<_i13.CategoryCubit>(
      () => _i13.CategoryCubit(get<_i6.ICategoryRepository>()));
  return get;
}
