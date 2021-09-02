import 'package:ecom_amazon/widgets/product_cards.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage>{

  late double height, width;
  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width, height: height,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 15,height: 1,),
              InkWell(
                onTap: () {
                  setState(() {tabIndex = 0;});
                },
                  child: Container(
                    height: 50,
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 2,color: tabIndex == 0 ? Colors.cyan : Colors.transparent))),
                      child: Center(child: Text("Live Orders",style: TextStyle(fontSize: 16,color: tabIndex == 0 ? Colors.cyan : Colors.black),))
                  )
              ),
              SizedBox(width: 30,height: 1,),
              InkWell(onTap: () {
                setState(() {tabIndex = 1;});
              },child: Container(
                height: 50,
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 2,color: tabIndex == 1 ? Colors.cyan : Colors.transparent))),
                  child: Center(child: Text("Order History",style: TextStyle(fontSize: 16,color: tabIndex == 1 ? Colors.cyan : Colors.black),))
                )
              )
            ],
          ),
          Expanded(
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 200),
                    left: tabIndex == 0 ? 0 : - width,
                    child: Container(
                      height: height, width: width,
                      child: ListView(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        children: [
                            LiveOrderProductCard()
                        ],
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 200),
                    left: tabIndex == 1 ? 0 : width,
                    child: Container(height:height,width: width,color: Colors.grey,),
                  ),
                ],
              )
          )
        ],
      ),
    );
  }
}
