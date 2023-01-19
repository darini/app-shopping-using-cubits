import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping2/di/di.dart';
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
    return MultiBlocProvider(
      providers: [
        //Account Cubit
        BlocProvider(
          create: (_) => AccountCubit(getIt<IAccountRepository>()),
        ),

        //Category Cubit
        BlocProvider(
            create: (_) => CategoryCubit(getIt<ICategoryRepository>())),

        //Product Cubit
        BlocProvider(create: (_) => ProductCubit(getIt<IProductRepository>())),

        //Cart Cubit
        BlocProvider(create: (_) => CartCubit()),
      ],
      child: BlocProvider(
        create: (context) => AuthCubit(
          getIt<IAccountRepository>(),
          context.read<AccountCubit>(),
          getIt<CartCubit>(),
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
