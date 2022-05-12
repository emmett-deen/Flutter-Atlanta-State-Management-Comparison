import 'dart:math';

import 'package:flutter_atlanta_state_management_comparison/data/models/product.dart';

class APIService {
  final List<Product> _products = [
    Product(id: 'p1', title: 'Red Shirt', price: 100),
    Product(id: 'p2', title: 'T-Shirt', price: 500),
    Product(id: 'p3', title: 'Blue Shirt', price: 300),
    Product(id: 'p4', title: 'Black Shirt', price: 550),
    Product(id: 'p5', title: 'White Shirt', price: 200),
  ];

  Future<void> mockLoadTime() {
    return Future.delayed(Duration(milliseconds: Random().nextInt(500) + 250));
  }

  Future<List<Product>> getAllProducts() async {
    await mockLoadTime();
    return _products;
  }

  Future<Product> getProduct(String id) async {
    await mockLoadTime();
    return _products.firstWhere((product) => product.id == id);
  }
}
