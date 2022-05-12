// ignore_for_file: avoid_print

import 'package:badges/badges.dart';
import 'package:flutter_atlanta_state_management_comparison/get/controllers/cart_controller.dart';
import 'package:flutter_atlanta_state_management_comparison/riverpod/providers/cart_provider.dart';
import 'package:flutter_atlanta_state_management_comparison/riverpod/providers/products_provider.dart';
import 'package:flutter_atlanta_state_management_comparison/widgets/product_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodProductListingScreen extends ConsumerWidget {
  const RiverpodProductListingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsProvider);
    if (products.isEmpty) {
      ref.watch(productsProvider.notifier).loadProducts();
    }
    final cart = ref.watch(cartProvider);
    print(cart);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Riverpod Product Listing'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Badge(
                position: BadgePosition.topEnd(end: -5),
                badgeContent: Text(cart.isNotEmpty
                    ? '${cart.length}'
                    : '0'),
                showBadge: cart.isNotEmpty,
                child: IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
        body: products.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: ((context) => GetProductDetailScreen(
                        //         product: products[index]))));
                      },
                      child: ProductListTile(
                        product: products[index],
                        quantity: cart.where((element) => element == products[index]).length,
                        onDecrement: (cart
                                    .where(
                                        (element) => element == products[index]).isEmpty)
                            ? null
                            : () {
                                ref
                                    .read(cartProvider.notifier)
                                    .removeProduct(products[index]);
                              },
                        onIncrement: () {
                          ref
                              .read(cartProvider.notifier)
                              .addProduct(products[index]);
                        },
                      ),
                    )));
  }
}
