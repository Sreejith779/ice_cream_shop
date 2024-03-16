part of 'product_bloc.dart';

@immutable
abstract class ProductState {}
abstract class ProductActionState {}

class ProductInitial extends ProductState {}


class ProductLoadedState extends ProductState{
  final List<ProductModel>productItem;

  ProductLoadedState({required this.productItem});
}
