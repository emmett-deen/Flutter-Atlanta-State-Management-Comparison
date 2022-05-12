import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_atlanta_state_management_comparison/data/models/product.dart';
import 'package:flutter_atlanta_state_management_comparison/widgets/product_list_tile.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class GetProductDetailScreen extends GetView<CartController> {
  final Product product;
  const GetProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Product Detail: ${product.title}'),
        actions: [
          Obx(() => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Badge(
                  position: BadgePosition.topEnd(end: -5),
                  badgeContent: Text(controller.cart.isNotEmpty
                      ? '${controller.cart.values.reduce((a, b) => a + b)}'
                      : '0'),
                  showBadge: controller.cart.isNotEmpty,
                  child: IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {},
                  ),
                ),
              ))
        ],
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 64,
          child: Obx(() => ProductListTile(
                product: product,
                quantity: controller.cart[product] ?? 0,
                onDecrement: (controller.cart[product] ?? 0) <= 0
                    ? null
                    : () {
                        controller.removeProduct(product);
                      },
                onIncrement: () {
                  controller.addProduct(product);
                },
              )),
        ),
      ),
    );
  }
}
