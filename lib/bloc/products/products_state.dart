part of 'products_bloc.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState.loading() = _Loading;
  const factory ProductsState.show(List<Product> products) = _Show;
}
