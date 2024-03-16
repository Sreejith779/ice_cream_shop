part of 'cart_bloc.dart';

@immutable
abstract class CartState {}
abstract class CartActionState extends CartState {}

class CartInitial extends CartState {}

class CartLoadedState extends CartState{
  final List<ProductModel>cartItem;

  CartLoadedState({required this.cartItem});
}
