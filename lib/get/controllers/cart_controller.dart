import 'package:get/get.dart';

import '../../data/models/product.dart';

class CartController extends GetxController {
  final RxMap<Product, int> cart = RxMap<Product, int>();

  void addProduct(Product product) {
    cart.putIfAbsent(product, () => 0);
    cart[product] = (cart[product] ?? 0) + 1;
  }

  void removeProduct(Product product){
    cart[product] = (cart[product] ?? 0) - 1;
    if ((cart[product] ?? 0) <= 0) {
      cart.remove(product);
    }
  }
}
