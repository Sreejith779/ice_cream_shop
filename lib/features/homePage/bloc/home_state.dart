part of 'home_bloc.dart';

@immutable
abstract class HomeState {}
abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}
class HomeLoadingState extends HomeState{}
class HomeLoadedState extends HomeState{

  final List<ProductModel>products = popularIceCreams.map((e) =>
  ProductModel(flavor: e["flavor"], description: e["description"], price: e["price"], image: e["image"])
  ).toList();

  final List<ProductModel>products1 = iceCreams.map((e) =>
      ProductModel(flavor: e["flavor"]??"unknown flavour", description: e["description"]?? "unknown",
          price: e["price"]??"unknown", image: e["image"]??"https://www.seekpng.com/png/full/129-1297672_fail-failed-icon-png.png")
  ).toList();

}
