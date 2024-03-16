import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ice_cream_shop/features/homePage/bloc/home_bloc.dart';
import 'package:ice_cream_shop/features/homePage/productModel/model.dart';
import 'package:ice_cream_shop/modelData/cartList%20_items.dart';
import 'package:ice_cream_shop/modelData/wishList_item.dart';

import '../bloc/wish_list_bloc.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  final WishListBloc wishListBloc = WishListBloc();


  @override
  void initState() {
wishListBloc.add(WishListInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishListBloc, WishListState>(
      bloc: wishListBloc,
      listenWhen: (previous, current) => (current is WishListActionState),
      buildWhen: (previous, current) => (current is! WishListActionState),
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case WishListLoadedState:
           final loadedState = state as WishListLoadedState;
            return Scaffold(
              appBar: AppBar(
                title: const Text("WishList"),
              ),
              backgroundColor: const Color(0xFFF1EFFF),
              body:ListView.builder(
                    itemCount: loadedState.wishList.length,
                    itemBuilder: (context,index){
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        margin: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                             height: 100,
                              width: 90,
                              decoration: BoxDecoration(

                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(image: NetworkImage(loadedState.wishList[index].image.toString()),
                                fit: BoxFit.cover)
                              ),
                            ),
                            Container(
                             margin: EdgeInsets.only(left: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(loadedState.wishList[index].flavor,style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),),
                                  Text(loadedState.wishList[index].price.toString(),style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),),
                               Row(
                                 children: [
                                   Container(
                                     height: 25,
                                     width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                     child: const Center(child: Text("Buy now",style: TextStyle(
                                       fontWeight: FontWeight.w500
                                     ),)),
                                   ),
                                   const SizedBox(
                                     width: 10,
                                   ),
                                   InkWell(
                                     onTap: (){
                                       wishListBloc.add(WishListRemoveEvent(deleteItem: loadedState.wishList[index]));
                                     },
                                     child: Container(
                                       height: 25,
                                       width: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.orange.withOpacity(0.4),
                                      ),
                                       child: const Center(child: Text("Delete",style: TextStyle(
                                         fontWeight: FontWeight.w500
                                       ),)),
                                     ),
                                   )
                                 ],
                               )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    })

            );
            break;
          default:
            return const Center(child: Text("Errors"));
        }
      },
    );
  }
}
