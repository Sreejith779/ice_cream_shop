import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ice_cream_shop/modelData/cartList%20_items.dart';
import 'package:meta/meta.dart';

import '../../homePage/productModel/model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
  on<CartInitialEvent>(cartInitialEvent);
  on<CartRemoveItemEvent>(cartRemoveItemEvent);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
emit(CartLoadedState(cartItem: cartListItems));
  }

  FutureOr<void> cartRemoveItemEvent(CartRemoveItemEvent event, Emitter<CartState> emit) {
    cartListItems.remove(event.deleteItem);
    emit(CartLoadedState(cartItem: cartListItems));

  }
}
