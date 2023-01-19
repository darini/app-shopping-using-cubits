import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping2/data/repository/account_repository.dart';
import 'package:shopping2/data/repository/category_repository.dart';
import 'package:shopping2/data/repository/product_repository.dart';
import 'package:shopping2/domain/account/repositories/account_repository_interface.dart';
import 'package:shopping2/domain/categories/repositories/category_repository_interface.dart';
import 'package:shopping2/domain/products/repositories/product_repository_interface.dart';
import 'package:shopping2/ui/account/auth/cubits/auth_cubit.dart';
import 'package:shopping2/ui/account/cubits/account_cubit.dart';
import 'package:shopping2/ui/app/pages/tabs.page.dart';
import 'package:shopping2/ui/cart/cubits/cart_cubit.dart';
import 'package:shopping2/ui/categories/cubits/category_cubit.dart';
import 'package:shopping2/ui/products/cubits/product_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ICategoryRepository _categoryRepository = CategoryRepository();
    IProductRepository _productRepository = ProductRepository();

    IAccountRepository _accountRepository = AccountRepository();

    return MultiBlocProvider(
      providers: [
        //Category Cubit
        BlocProvider(create: (_) => CategoryCubit(_categoryRepository)),

        //Product Cubit
        BlocProvider(create: (_) => ProductCubit(_productRepository)),

        //Product Cubit
        BlocProvider(create: (_) => CartCubit()),

        BlocProvider(
          create: (_) => AccountCubit(_accountRepository),
        ),
      ],
      child: BlocProvider(
        create: (context) => AuthCubit(
          _accountRepository,
          context.read<AccountCubit>(),
          context.read<CartCubit>(),
        ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Shopping',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const DefaultTabController(
            length: 3,
            child: TabsPage(),
          ),
        ),
      ),
    );
  }
}
