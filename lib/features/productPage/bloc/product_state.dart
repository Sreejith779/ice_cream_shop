part of 'product_bloc.dart';

@immutable
abstract class ProductState {}
abstract class ProductActionState extends ProductState {}

class ProductInitial extends ProductState {}


class ProductLoadedState extends ProductState{
  final List<ProductModel>productItem;

  ProductLoadedState({required this.productItem});
}
class ProductCartedState extends ProductState{}

class ProductBuyState extends ProductState{}
class ProductNavigateActionState extends ProductActionState{}

