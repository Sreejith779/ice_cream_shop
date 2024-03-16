import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ice_cream_shop/features/productPage/bloc/product_bloc.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final ProductBloc productBloc = ProductBloc();

  @override
  void initState() {
    productBloc.add(ProductInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>(
      bloc: productBloc,
      listenWhen: (previous,current)=> (current is ProductActionState),
      buildWhen: (previous,current)=> (current is !ProductActionState),
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
      switch(state.runtimeType){
        case ProductLoadedState:
          final loadedState =  state as ProductLoadedState;
          return Scaffold(
            body: Container(
          child: ListView.builder(
            itemCount:loadedState.productItem.length ,
              itemBuilder: (context,index){
              return Stack(
                children: [
                  Container(
                                   height: 800,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(loadedState.productItem[index].image.toString()),
                      fit: BoxFit.cover)
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 500),
                    padding: EdgeInsets.all(20),
                    height: 300,
                   width: double.maxFinite,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(20),
                     color: Colors.grey.withOpacity(0.6),
                   ),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(loadedState.productItem[index].flavor,
                        style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold,
                        color: Colors.black),),
                        Text(loadedState.productItem[index].description,
                        style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500,
                        color: Colors.black),),
                      ],
                    ) ,
                  )
                ],
              );
              }),
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
