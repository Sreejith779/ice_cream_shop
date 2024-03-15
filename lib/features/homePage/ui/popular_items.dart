import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:ice_cream_shop/features/homePage/productModel/model.dart';
import 'package:ice_cream_shop/model/popular_item.dart';


class ProductTile extends StatefulWidget {
  const ProductTile({super.key, required this.productModel});
  final List<ProductModel>productModel;

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {

  @override
  Widget build(BuildContext context) {

    return Container(
      child: CarouselSlider.builder(
          itemCount:popularIceCreams.length,
          itemBuilder: (context,index,realIndex){
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),

             
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                      image: NetworkImage(widget.productModel[index].imageUrl.toString()))

              ),
            );
          }, options:
      CarouselOptions(height: 200,

        viewportFraction: 0.5,
        enlargeFactor: 10,
        initialPage: 0,
        animateToClosest: true,
      )),
    );
  }
}
