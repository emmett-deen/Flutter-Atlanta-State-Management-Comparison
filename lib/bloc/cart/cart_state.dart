part of 'cart_bloc.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.loading(Map<Product, int> cart) = _Loading;
  const factory CartState.show(Map<Product, int> cart) = _Show;
}
