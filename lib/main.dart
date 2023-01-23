import 'package:flutter/material.dart';
import 'package:shopping2/ui/account/auth/cubits/auth_cubit.dart';
import 'package:shopping2/ui/products/cubits/product_cubit.dart';

import 'di/di.dart';
import 'ui/app/pages/app.dart';

void main() {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();

  //getIt<ProductCubit>().getAll();

  runApp(const MyApp());
}
