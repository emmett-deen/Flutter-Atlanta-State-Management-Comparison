import 'package:flutter_atlanta_state_management_comparison/data/api/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/product.dart';

part 'products_event.dart';
part 'products_state.dart';
part 'products_bloc.freezed.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(const _Loading()) {
    on<ProductsEvent>((event, emit) async {
      switch (event.runtimeType) {
        case _LoadProducts:
          emit(const _Loading());
          emit(_Show(await APIService().getAllProducts()));
          break;
        default:
      }
    });
  }
}
