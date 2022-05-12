import 'package:badges/badges.dart';
import 'package:flutter_atlanta_state_management_comparison/bloc/cart/cart_bloc.dart';
import 'package:flutter_atlanta_state_management_comparison/bloc/products/products_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../products/products_bloc.dart';

class BlocProductListingScreen extends StatelessWidget {
  const BlocProductListingScreen({Key? key}) : super(key: key);

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
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Bloc Product Listing'),
            actions: [
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return Badge(
                    badgeContent:
                        Text('${state.cart.values.reduce((a, b) => a + b)}'),
                    child: IconButton(
                      icon: const Icon(
                        Icons.shopping_cart,
                      ),
                      onPressed: () {},
                    ),
                  );
                },
              )
            ],
          ),
          body: BlocBuilder<ProductsBloc, ProductsState>(
              builder: ((context, state) {
            return state.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                show: (products) => ListView.builder(
                  itemCount: products.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(products[index].title),
                      subtitle: Text(products[index].priceToString()),
                    )));
          }))),
    );
  }
}
