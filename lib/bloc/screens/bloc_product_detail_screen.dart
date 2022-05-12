import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_atlanta_state_management_comparison/data/models/product.dart';
import 'package:flutter_atlanta_state_management_comparison/widgets/product_list_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cart/cart_bloc.dart';

class BlocProductDetailScreen extends StatelessWidget {
  final Product product;
  const BlocProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Product Detail: ${product.title}'),
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
      body: Center(
        child: SizedBox(
          width: 300,
          height: 64,
          child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
            return ProductListTile(
              product: product,
              quantity: state.cart[product] ?? 0,
              onDecrement: (state.cart[product] ?? 0) <= 0
                  ? null
                  : () {
                      context
                          .read<CartBloc>()
                          .add(CartEvent.removeProduct(product));
                    },
              onIncrement: () {
                context
                    .read<CartBloc>()
                    .add(CartEvent.addProduct(product));
              },
            );
          }),
        ),
      ),
    );
  }
}
