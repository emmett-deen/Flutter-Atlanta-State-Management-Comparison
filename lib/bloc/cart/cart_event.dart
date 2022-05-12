part of 'cart_bloc.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.addProduct(Product product) = _AddProduct;
  const factory CartEvent.removeProduct(Product product) = _RemoveProduct;
}