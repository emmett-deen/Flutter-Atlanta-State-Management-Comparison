import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_atlanta_state_management_comparison/data/models/product.dart';
import 'package:flutter_atlanta_state_management_comparison/widgets/product_list_tile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/cart_provider.dart';

class RiverpodProductDetailScreen extends ConsumerWidget {
  final Product product;
  const RiverpodProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Product Detail: ${product.title}'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Badge(
              position: BadgePosition.topEnd(end: -5),
              badgeContent: Text(cart.isNotEmpty ? '${cart.length}' : '0'),
              showBadge: cart.isNotEmpty,
              child: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 64,
          child: ProductListTile(
            product: product,
            quantity:
                cart.where((element) => element == product).length,
            onDecrement:
                (cart.where((element) => element == product ).isEmpty)
                    ? null
                    : () {
                        ref
                            .read(cartProvider.notifier)
                            .removeProduct(product);
                      },
            onIncrement: () {
              ref.read(cartProvider.notifier).addProduct(product);
            },
          ),
        ),
      ),
    );
  }
}
