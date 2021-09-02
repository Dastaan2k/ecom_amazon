import 'package:ecom_amazon/widgets/product_cards.dart';
import 'package:flutter/material.dart';

class DealsPage extends StatefulWidget {
  const DealsPage({Key? key}) : super(key: key);

  @override
  _DealsPageState createState() => _DealsPageState();
}

class _DealsPageState extends State<DealsPage> {

  late double width, height;

  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width,height: height,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Ongoing Offers",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
            SizedBox(width: 1,height: 10,),
            Text("Shop here and get lightning fast deals and other great offers"),
            SizedBox(height: 20,width: 1,),
            Text("Filters :",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
            SizedBox(
              height: 80,
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 15),
                scrollDirection: Axis.horizontal,
                children: List.generate(5, (index) => Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300,width: 1)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Category",style: TextStyle(fontSize: 16),),
                        SizedBox(width: 5,height: 1,),
                        Icon(Icons.keyboard_arrow_down_rounded,size: 20,),
                      ],
                    ),
                  ),
                )),
              ),
            ),
            Container(width: width,height: 1,color: Colors.grey.shade300,),
            Expanded(
              child: GridView.count(
                scrollDirection: Axis.vertical,
                crossAxisCount: 2,
                crossAxisSpacing: 20, mainAxisSpacing: 20,
                childAspectRatio: 0.5,
                children: List.generate(1, (index) => SizedBox(width: width*0.4,child: OfferProductCard())),
              ),
            )
          ],
        ),
      ),
    );
  }
}
