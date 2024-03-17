part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}
class ProductInitialEvent extends ProductEvent{}

class ProductBuyEvent extends ProductEvent{
  final ProductModel productModel;

  ProductBuyEvent({required this.productModel});
}

