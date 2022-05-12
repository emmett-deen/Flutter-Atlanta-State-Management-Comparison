import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_atlanta_state_management_comparison/data/models/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const _Show({})) {
    Map<Product, int> cart = {};

    on<CartEvent>((event, emit) {
      switch (event.runtimeType) {
        case _AddProduct:
          cart.putIfAbsent(event.product, () => 0);
          cart[event.product] = (cart[event.product] ?? 0) + 1;
          emit(_Show(cart));
          break;
      }
    });
  }
}
