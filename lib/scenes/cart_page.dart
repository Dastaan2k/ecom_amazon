import 'package:ecom_amazon/misc/providers.dart';
import 'package:ecom_amazon/widgets/product_cards.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


//TODO: Add independent widgets for thick and thin dividers

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  late double width, height;

  bool pseudoInitState = true;

  bool floatVisible = false;
  GlobalKey _upperFloatContainerKey = GlobalKey();
  late double upperContainerSize = 0;

  ScrollController _scrollController = ScrollController();

  late GeneralProvider _generalProvider;


  @override
  Widget build(BuildContext context) {

    if(pseudoInitState) {
      width = MediaQuery.of(context).size.width;
      height = MediaQuery.of(context).size.height;

      _generalProvider = Provider.of<GeneralProvider>(context,listen: false);


      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {

        if(_generalProvider.appbarType != 1) {
          _generalProvider.appbarType = 1;
          _generalProvider.appbarState = 0;
          _generalProvider.notifyMyListener();
        }

        if (upperContainerSize == 0) {
          var x = (_upperFloatContainerKey.currentContext!.findRenderObject()) as RenderBox;
          upperContainerSize = x.size.height + 25;
        }
      });

      _scrollController.addListener(() {

        /// Commented part is only of pages with appbar type 0 :
        /*if(_scrollController.offset < 30 && _generalProvider.appbarState != 1) {
          _generalProvider.appbarState = 1;
          _generalProvider.notifyMyListener();
        }
        else if(_scrollController.offset > 30 && _generalProvider.appbarState != 0) {
          _generalProvider.appbarState = 0;
          _generalProvider.notifyMyListener();
        } */

        if (_scrollController.offset > upperContainerSize && !floatVisible) {
          setState(() {floatVisible = true;});
        }
        if (_scrollController.offset <= upperContainerSize && floatVisible) {
          setState(() {floatVisible = false;});
        }
      });

      pseudoInitState = false;
    }


    return Material(
      child: Stack(
        children: [
          SizedBox(
            width: width,height: height,
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 15),
              controller: _scrollController,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 7.5),
                  child: SizedBox(
                    key: _upperFloatContainerKey,
                    width: width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Text.rich(TextSpan(
                            children: [
                              TextSpan(text: "Subtotal ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500)),
                              TextSpan(text: "80,199",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                            ]
                          )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 15),
                          child: Row(
                            children: [
                              Icon(Icons.check,color: Colors.green,size: 20),
                              SizedBox(width: 10,height: 1,),
                              Text.rich(TextSpan(children:[
                                TextSpan(text: "Part of your order qualifies for FREE Delivery.",style: TextStyle(fontSize: 14,color: Colors.green))
                              ]))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 7.5),
                  child: Container(
                    width: width, height: 50,
                    decoration: BoxDecoration(color: Colors.amberAccent,borderRadius: BorderRadius.circular(10)),
                    child: Center(child: Text("Proceed to Buy",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 7.5),
                  child: Container(width: width,height: 1.5,color: Colors.grey.shade400,),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15,vertical: 7.5),
                  child: Column(
                    children: [
                      CartProductCard(),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7.5),
                        child: Container(width: width,height: 1.5,color: Colors.grey.shade400,),
                      ),
                      CartProductCard(),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 7.5),
                        child: Container(width: width,height: 1.5,color: Colors.grey.shade400,),
                      ),
                      CartProductCard(),
                    ],
                  ),
                ),

              ],
            ),
          ),
          Align(alignment: Alignment.topCenter,child: Opacity(opacity: floatVisible ? 1 : 0,
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 7.5),
            child: Container(
              width: width, height: 50,
              decoration: BoxDecoration(color: Colors.amberAccent,borderRadius: BorderRadius.circular(10)),
              child: Center(child: Text("Proceed to Buy",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),),
            ),
          ),
          )),
        ],
      ),
    );
  }
}



