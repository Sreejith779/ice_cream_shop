part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}
class WishListButtonNavigateEvent extends HomeEvent{}
class CartButtonNavigateEvent extends HomeEvent{}


class WishListButtonClickedEvent extends HomeEvent{
  final ProductModel clickedProduct;

  WishListButtonClickedEvent({required this.clickedProduct});
}
class CartButtonClickedEvent extends HomeEvent{

  final ProductModel clickedProduct;

  CartButtonClickedEvent({required this.clickedProduct});
}

class ProductNavigateEvent extends HomeEvent{
  final ProductModel productDataList;

  ProductNavigateEvent({required this.productDataList});
}