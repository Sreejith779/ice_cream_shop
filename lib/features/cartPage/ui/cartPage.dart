import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
 cartBloc.add(CartInitialEvent());
    super.initState();
  }
  final CartBloc cartBloc = CartBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      bloc: cartBloc,
      listenWhen: (previous,current)=> (current is CartActionState),
      buildWhen: (previous,current)=> (current is !CartActionState),
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch(state.runtimeType){
          case CartLoadedState:
            final loadedState = state as CartLoadedState;
            return Scaffold(
              backgroundColor: const Color(0xFFF1EFFF),
appBar: AppBar(
  title: Text("Cart"),
),
body: Container(
  margin: EdgeInsets.all(15),

  
 decoration: BoxDecoration(
   borderRadius: BorderRadius.circular(10),


 ),
  child: Column(
    children: [
      Expanded(
        child: ListView.builder(
            itemCount:loadedState.cartItem.length,
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
                          image: DecorationImage(image: NetworkImage(loadedState.cartItem[index].image.toString()),
                              fit: BoxFit.cover)
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(loadedState.cartItem[index].flavor,style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),),
                          Text("Rs ${loadedState.cartItem[index].price.toString()}",style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: (){
                           cartBloc.add(CartRemoveItemEvent(deleteItem: loadedState.cartItem[index]));
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
                      ),
                    )
                  ],
                ),
              );
        
            }),
      ),
      Container(
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.brown.withOpacity(0.8),
        ),
        child: const Center(child: Text("Place Order",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: Colors.white70,
          fontSize: 19
        ),)),
      )
    ],
  ),
),
            );
            break;
          default:
         return const Center(child: Text("Error"));
        }
      },
    );
  }
}
