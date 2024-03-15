
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ice_cream_shop/features/homePage/ui/popular_items.dart';

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
      listenWhen: (previous,current)=> (current is HomeActionState),
      buildWhen: (previous,current)=> (current is !HomeActionState),
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch(state.runtimeType){
          case HomeLoadingState:
            return const Scaffold(
              body: Center(child: Text("Loading")),
            );

          case HomeLoadedState:
            final loadedState = state as HomeLoadedState;

            return Scaffold(
              backgroundColor: const Color(0xFFF1EFFF),
              body: Container(
                margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.95),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 5,
                                      color: Colors.grey.withOpacity(0.3),
                                      blurStyle: BlurStyle.outer)
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.person,
                                  size: 25,
                                  color: Colors.grey.withOpacity(0.6),
                                ))),
                        const SizedBox(
                          width: 205,
                        ),
                        Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.95),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 5,
                                      color: Colors.grey.withOpacity(0.3),
                                      blurStyle: BlurStyle.outer)
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite_outline,
                                  size: 25,
                                  color: Colors.grey.withOpacity(0.6),
                                ))),
                        Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.95),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 5,
                                      color: Colors.grey.withOpacity(0.3),
                                      blurStyle: BlurStyle.outer)
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.shopping_cart,
                                  size: 25,
                                  color: Colors.grey.withOpacity(0.6),
                                ))),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
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
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                     ProductTile(productModel:loadedState.productModel),
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
}

