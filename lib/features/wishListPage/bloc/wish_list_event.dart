part of 'wish_list_bloc.dart';

@immutable
abstract class WishListEvent {}
class WishListInitialEvent extends WishListEvent{}
class WishListRemoveEvent extends WishListEvent{

  final ProductModel deleteItem;

  WishListRemoveEvent({required this.deleteItem});
}
