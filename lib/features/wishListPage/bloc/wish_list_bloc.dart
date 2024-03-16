import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ice_cream_shop/features/homePage/productModel/model.dart';
import 'package:ice_cream_shop/modelData/wishList_item.dart';
import 'package:meta/meta.dart';

part 'wish_list_event.dart';
part 'wish_list_state.dart';

class WishListBloc extends Bloc<WishListEvent, WishListState> {
  WishListBloc() : super(WishListInitial()) {
    on<WishListInitialEvent>(wishListInitialEvent);
    on<WishListRemoveEvent>(wishListRemoveEvent);
  }

  FutureOr<void> wishListInitialEvent(WishListInitialEvent event, Emitter<WishListState> emit) {
    emit(WishListLoadedState(wishList:wishListItems));
  }

  FutureOr<void> wishListRemoveEvent(WishListRemoveEvent event, Emitter<WishListState> emit) {
    wishListItems.remove(event.deleteItem);
    emit(WishListLoadedState(wishList: wishListItems));
  }
}
