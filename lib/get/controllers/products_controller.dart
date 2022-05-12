import 'package:flutter_atlanta_state_management_comparison/data/api/api_service.dart';
import 'package:get/get.dart';

import '../../data/models/product.dart';

class ProductsController extends GetxController {
  final RxList<Product> products = RxList<Product>();

  @override
  void onInit() async {
    products.value = await APIService().getAllProducts();
    super.onInit();
  }
}
