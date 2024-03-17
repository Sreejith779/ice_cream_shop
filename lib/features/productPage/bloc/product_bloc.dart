import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ice_cream_shop/features/homePage/productModel/model.dart';
import 'package:ice_cream_shop/modelData/cartList%20_items.dart';
import 'package:ice_cream_shop/modelData/productData.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
   on<ProductInitialEvent>(productInitialEvent);
on<ProductBuyEvent>(productBuyEvent);
  }

  FutureOr<void> productInitialEvent(ProductInitialEvent event, Emitter<ProductState> emit) {
    emit(ProductLoadedState(productItem: productItem));
  }





  FutureOr<void> productBuyEvent(ProductBuyEvent event, Emitter<ProductState> emit) {
    cartListItems.add(event.productModel);
    print("List added");
    emit(ProductNavigateActionState());

  }
}
