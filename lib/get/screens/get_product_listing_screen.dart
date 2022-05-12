// ignore_for_file: avoid_print

import 'package:badges/badges.dart';
import 'package:flutter_atlanta_state_management_comparison/get/controllers/cart_controller.dart';
import 'package:flutter_atlanta_state_management_comparison/widgets/product_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/products_controller.dart';
import 'get_product_detail_screen.dart';

class GetProductListingScreen extends GetView<ProductsController> {
  const GetProductListingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Get Product Listing'),
          actions: [
            Obx(() => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Badge(
                    position: BadgePosition.topEnd(end: -5),
                    badgeContent: Text(Get.find<CartController>()
                            .cart
                            .isNotEmpty
                        ? '${Get.find<CartController>().cart.values.reduce((a, b) => a + b)}'
                        : '0'),
                    showBadge: Get.find<CartController>().cart.isNotEmpty,
                    child: IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      onPressed: () {},
                    ),
                  ),
                ))
          ],
        ),
        body: Obx(() {
          print('rebuild ${Get.find<CartController>().cart.toString()}');
          
          if (controller.products.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => GetProductDetailScreen(
                                product: controller.products[index]))));
                      },
                      child: ProductListTile(
                        product: controller.products[index],
                        quantity: Get.find<CartController>()
                                .cart[controller.products[index]] ??
                            0,
                        onDecrement: (Get.find<CartController>()
                                        .cart[controller.products[index]] ??
                                    0) <=
                                0
                            ? null
                            : () {
                                Get.find<CartController>()
                                    .removeProduct(controller.products[index]);
                              },
                        onIncrement: () {
                          Get.find<CartController>()
                              .addProduct(controller.products[index]);
                        },
                      ),
                    ));
          }
        }));
  }
}
