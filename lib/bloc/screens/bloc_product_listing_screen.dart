import 'dart:math';

import 'package:badges/badges.dart';
import 'package:flutter_atlanta_state_management_comparison/bloc/cart/cart_bloc.dart';
import 'package:flutter_atlanta_state_management_comparison/bloc/products/products_bloc.dart';
import 'package:flutter_atlanta_state_management_comparison/bloc/screens/bloc_product_detail_screen.dart';
import 'package:flutter_atlanta_state_management_comparison/widgets/product_list_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../products/products_bloc.dart';

class BlocProductListingScreen extends StatelessWidget {
  const BlocProductListingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Bloc Product Listing'),
          actions: [
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Badge(
                    position: BadgePosition.topEnd(end: -5),
                    badgeContent: Text(state.cart.isNotEmpty
                        ? '${state.cart.values.reduce((a, b) => a + b)}'
                        : '0'),
                    showBadge: state.cart.isNotEmpty,
                    child: IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      onPressed: () {},
                    ),
                  ),
                );
              },
            )
          ],
        ),
        body: BlocBuilder<ProductsBloc, ProductsState>(
          builder: ((context, state) {
            return state.when(
                loading: () =>
                    const Center(child: CircularProgressIndicator()),
                show: (products) => ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) =>
                        BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            BlocProductDetailScreen(
                                                product:
                                                    products[index]))));
                              },
                              child: ProductListTile(
                                product: products[index],
                                quantity: state.cart[products[index]] ?? 0,
                                onDecrement:
                                    (state.cart[products[index]] ?? 0) <= 0
                                        ? null
                                        : () {
                                            context.read<CartBloc>().add(
                                                CartEvent.removeProduct(
                                                    products[index]));
                                          },
                                onIncrement: () {
                                  context.read<CartBloc>().add(
                                      CartEvent.addProduct(
                                          products[index]));
                                },
                              ),
                            );
                          },
                        )));
          }),
        ));
  }
}
