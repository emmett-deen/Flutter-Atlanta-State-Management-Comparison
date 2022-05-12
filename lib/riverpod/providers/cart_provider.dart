import 'package:flutter_atlanta_state_management_comparison/data/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProvider =
    StateNotifierProvider<Cart, List<Product>>((ref) => Cart(ref));

class Cart extends StateNotifier<List<Product>> {
  Cart(this.ref) : super([]);

  final Ref ref;

  void addProduct(Product product) {
    state = [...state, product];
  }

  void removeProduct(Product product) {
    var old = [...state];
    if (old.contains(product)) {
      old.remove(product);
    }
    state = old;
  }
}
