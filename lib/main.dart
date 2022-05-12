import 'package:flutter/material.dart';
import 'package:flutter_atlanta_state_management_comparison/bloc/cart/cart_bloc.dart';
import 'package:flutter_atlanta_state_management_comparison/bloc/products/products_bloc.dart';
import 'package:flutter_atlanta_state_management_comparison/get/controllers/cart_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'get/controllers/products_controller.dart';
import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<CartController>(CartController(), permanent: true);
  Get.put<ProductsController>(ProductsController(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CartBloc>(
            create: (BuildContext context) => CartBloc(),
          ),
          BlocProvider<ProductsBloc>(
            create: (BuildContext context) =>
                ProductsBloc()..add(const ProductsEvent.loadProducts()),
          ),
        ],
        child: MaterialApp(
      title: 'Flutter State Management Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    ));
  }
}


