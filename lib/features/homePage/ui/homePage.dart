import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ice_cream_shop/features/cartPage/ui/cartPage.dart';
import 'package:ice_cream_shop/features/homePage/ui/popular_itemTile.dart';
import 'package:ice_cream_shop/features/homePage/ui/popular_items.dart';
import 'package:ice_cream_shop/features/productPage/ui/productPage.dart';
import 'package:ice_cream_shop/features/wishListPage/ui/wishList.dart';

import '../bloc/home_bloc.dart';
import '../productModel/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => (current is HomeActionState),
      buildWhen: (previous, current) => (current is! HomeActionState),
      listener: (context, state) {
        if (state is WishListNavigateState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const WishListPage()));
        } else if (state is CartNavigateState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const CartPage()));
        } else if (state is WishListClickedState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Item wishlisted")));
        } else if (state is CartClickedState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Carted Successfully")));
        }else if(state is ProductNavigateState){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>
          const ProductPage()));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(child: Text("Loading")),
            );
            break;
          case HomeLoadedState:
            final loadedState = state as HomeLoadedState;
            ProductModel productModel;
            return Scaffold(
              backgroundColor: const Color(0xFFF1EFFF),
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                leading: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.person,
                      size: 25,
                      color: Colors.grey.withOpacity(0.6),
                    )),
                actions: [
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white70),
                          child: IconButton(
                              onPressed: () {
                                homeBloc.add(WishListButtonNavigateEvent());
                              },
                              icon: Icon(
                                Icons.favorite_outline,
                                size: 25,
                                color: Colors.grey.withOpacity(0.6),
                              )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white70),
                          child: IconButton(
                              onPressed: () {
                                homeBloc.add(CartButtonNavigateEvent());
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                // CartPage()));
                              },
                              icon: Icon(
                                Icons.shopping_cart,
                                size: 25,
                                color: Colors.grey.withOpacity(0.6),
                              )),
                        )
                      ],
                    ),
                  )
                ],
              ),
              body: Container(
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Choose your",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey)),
                        Text("Taste!",
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w500,
                                color: Colors.deepOrange.withOpacity(0.5))),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Popular IceCreams",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                            child: CarouselSlider.builder(
                                itemCount: loadedState.products.length ?? 0,
                                itemBuilder: (context, index, realIndex) {
                                  return carouselCard(
                                      loadedState.products[index]);
                                },
                                options: CarouselOptions(
                                  height: 300,
                                  animateToClosest: true,
                                ))),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Recommended",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          child: Container(
                            height: 500,
                            child: ListView.builder(
                                itemCount: loadedState.products1.length ?? 0,
                                itemBuilder: (context, index) {
                                  return InkWell(onTap: (){
                                    homeBloc.add(ProductNavigateEvent(productDataList: loadedState.products1[index]));
                                  },
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(15)),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          loadedState
                                                              .products1[index]
                                                              .image
                                                              .toString()),
                                                      fit: BoxFit.cover),
                                                  borderRadius:
                                                      BorderRadius.circular(20)),
                                              height: 120,
                                              width: 100,
                                              margin: const EdgeInsets.all(10)),
                                          Container(
                                            padding: EdgeInsets.only(
                                                bottom: 10, left: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  loadedState
                                                      .products1[index].flavor,
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w600),
                                                ),
                                                Text(
                                                  " Rs ${loadedState.products1[index].price.toString()}",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w600,
                                                      color: Colors.black
                                                          .withOpacity(0.8)),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 20),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(12),
                                                            color: Colors.white70),
                                                        height: 40,
                                                        child: IconButton(
                                                            onPressed: () {
                                                              homeBloc.add(WishListButtonClickedEvent(
                                                                  clickedProduct:
                                                                      loadedState
                                                                              .products1[
                                                                          index]));
                                                            },
                                                            icon: Icon(
                                                              Icons
                                                                  .favorite_outline,
                                                              size: 25,
                                                              color: Colors.grey
                                                                  .withOpacity(0.6),
                                                            )),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(12),
                                                            color: Colors.white70),
                                                        height: 40,
                                                        child: IconButton(
                                                            onPressed: () {
                                                              homeBloc.add(CartButtonClickedEvent(
                                                                  clickedProduct:
                                                                      loadedState
                                                                              .products1[
                                                                          index]));
                                                            },
                                                            icon: Icon(
                                                              Icons.shopping_cart,
                                                              size: 25,
                                                              color: Colors.grey
                                                                  .withOpacity(0.6),
                                                            )),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );

          default:
            return const Center(child: Text("Error"));
        }
      },
    );
  }

  Widget carouselCard(ProductModel product) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                    image: NetworkImage(product.image), fit: BoxFit.fill),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      color: Colors.black26)
                ]),
          ),
        ),
        Positioned(
          top: 200,
          left: 35,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.85),
                borderRadius: BorderRadius.circular(15)),
            width: 140,
            height: 60,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      product.flavor,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black.withOpacity(0.8)),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Rs ${product.price.toString()}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black.withOpacity(0.8)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: 205,
            right: 40,
            child: InkWell(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white70),
                height: 50,
                width: 50,
                child:  IconButton(onPressed: (){
                  homeBloc.add(CartButtonClickedEvent(clickedProduct:product));
                }, icon: const Icon(Icons.shopping_cart))
              ),
            ))
      ],
    );
  }
}
