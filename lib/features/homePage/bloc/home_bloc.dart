
import 'dart:async';


import 'package:bloc/bloc.dart';
import 'package:ice_cream_shop/modelData/cartList%20_items.dart';
import 'package:ice_cream_shop/modelData/productData.dart';
import 'package:ice_cream_shop/modelData/wishList_item.dart';
import 'package:meta/meta.dart';

import '../../../modelData/popular_item.dart';
import '../../../modelData/product_item.dart';
import '../productModel/model.dart';


part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
on<HomeInitialEvent>(homeInitialEvent);
on<WishListButtonNavigateEvent>(wishListButtonNavigateEvent);
on<CartButtonNavigateEvent>(cartButtonNavigateEvent);
on<WishListButtonClickedEvent>(wishListButtonClickedEvent);
on<CartButtonClickedEvent>(cartButtonClickedEvent);
on<ProductNavigateEvent>(productNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit)async {
    print("loading");
    emit(HomeLoadingState());
    await Future.delayed( Duration(seconds: 1));
    emit(HomeLoadedState());

  }

  FutureOr<void> wishListButtonNavigateEvent(WishListButtonNavigateEvent event, Emitter<HomeState> emit) {
 print("wishlist Navigate");
    emit(WishListNavigateState());
  }

  FutureOr<void> cartButtonNavigateEvent(CartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("Navigated");
    emit(CartNavigateState());
  }

  FutureOr<void> wishListButtonClickedEvent(WishListButtonClickedEvent event, Emitter<HomeState> emit) {

    wishListItems.add(event.clickedProduct);
    print("item wishlisted");
    emit(WishListClickedState());
  }

  FutureOr<void> cartButtonClickedEvent(CartButtonClickedEvent event, Emitter<HomeState> emit) {

    cartListItems.add(event.clickedProduct);
    print("item Carted");
    emit(CartClickedState());


  }

  FutureOr<void> productNavigateEvent(ProductNavigateEvent event, Emitter<HomeState> emit) {
   productItem.add(event.productDataList);
    print("Product item added");
    emit(ProductNavigateState());

  }
}
