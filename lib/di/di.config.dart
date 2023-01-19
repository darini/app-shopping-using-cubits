// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../domain/account/repositories/account_repository_interface.dart'
    as _i4;
import '../domain/products/repositories/product_repository_interface.dart'
    as _i7;
import '../ui/account/auth/cubits/auth_cubit.dart' as _i3;
import '../ui/cart/cubits/cart_cubit.dart' as _i5;
import '../ui/products/cubits/product_cubit.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt init(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.AuthCubit>(
      _i3.AuthCubit(get<_i4.IAccountRepository>(), get<_i5.CartCubit>()));
  gh.lazySingleton<_i6.ProductCubit>(
      () => _i6.ProductCubit(get<_i7.IProductRepository>()));
  return get;
}
