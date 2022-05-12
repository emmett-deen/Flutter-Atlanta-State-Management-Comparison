import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  Product._();
  factory Product({
    required String id,
    required String title,
    required int price
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
    _$ProductFromJson(json);

  String priceToString() => '\$${(price/100.0).toStringAsFixed(2)}';
}