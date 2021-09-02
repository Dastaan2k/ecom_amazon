import 'package:ecom_amazon/widgets/product_cards.dart';
import 'package:flutter/material.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {

  late double width, height;

  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width, height: height,
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 15),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text("Shopping List",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
          ),
          SizedBox(width: 1,height: 20,),
          Column(
            children: List.generate(5, (index) => WishlistProductCard()),
          ),
        ],
      ),
    );
  }
}
