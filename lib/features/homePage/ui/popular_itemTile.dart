import 'package:flutter/material.dart';
import 'package:ice_cream_shop/features/homePage/productModel/model.dart';


class PopularItemTile extends StatefulWidget {
  const PopularItemTile({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<PopularItemTile> createState() => _PopularItemTileState();
}

class _PopularItemTileState extends State<PopularItemTile> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),


      decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
              image: NetworkImage(widget.productModel.image.toString()))

      ),
    );
  }
}
