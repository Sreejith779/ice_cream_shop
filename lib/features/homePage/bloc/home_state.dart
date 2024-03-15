part of 'home_bloc.dart';

@immutable
abstract class HomeState {}
abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}
class HomeLoadingState extends HomeState{}
class HomeLoadedState extends HomeState{

  final List<ProductModel>productModel = popularIceCreams.map((e) =>
  ProductModel(flavour: e["flavour"], description: e["description"], price: e["price"], imageUrl: e["imageUrl"])
  ).toList();

 
}
