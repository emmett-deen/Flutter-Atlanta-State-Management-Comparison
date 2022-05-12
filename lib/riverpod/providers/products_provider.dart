import 'package:flutter_atlanta_state_management_comparison/data/api/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/product.dart';

final productsProvider = StateNotifierProvider<Products, List<Product>>((ref) =>Products(ref));

class Products extends StateNotifier<List<Product>> {
  Products(this.ref) : super([]){
    // loadProducts();
  }

  final Ref ref;

  Future<void> loadProducts() async {
    state = await APIService().getAllProducts();
  }
}
