import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ice_cream_shop/features/homePage/productModel/model.dart';
import 'package:ice_cream_shop/modelData/productData.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
   on<ProductInitialEvent>(productInitialEvent);
  }

  FutureOr<void> productInitialEvent(ProductInitialEvent event, Emitter<ProductState> emit) {
    emit(ProductLoadedState(productItem: productItem));
  }
}
