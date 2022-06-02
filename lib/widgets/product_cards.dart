import 'package:ecom_amazon/misc/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {

  late double width, height = 220;

  late RouterProvider _routerProvider;

  @override
  Widget build(BuildContext context) {

    _routerProvider = Provider.of<RouterProvider>(context);

    width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
      child: InkWell(
        onTap: () {
          _routerProvider.currentPage = "product";
          _routerProvider.notifyMyListener();
        },
        child: Container(
          width: width, height: height,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),border: Border.all(color: Colors.grey.shade200,width: 1)
          ),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.grey.shade100,
                    child: Center(child: Image.asset('assets/iphone-1.png',fit: BoxFit.contain,)),
                  ),
              ),
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("New Apple iPhone 12 (128GB) - Purple",maxLines: 2,style: TextStyle(fontSize: 16,color: Colors.grey.shade900,fontWeight: FontWeight.w600),),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Container(width: 12,height: 12,decoration: BoxDecoration(color: Colors.orangeAccent,border: Border.all(color: Colors.orange,width: 1),shape: BoxShape.circle),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Container(width: 12,height: 12,decoration: BoxDecoration(color: Colors.orangeAccent,border: Border.all(color: Colors.orange,width: 1),shape: BoxShape.circle),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Container(width: 12,height: 12,decoration: BoxDecoration(color: Colors.orangeAccent,border: Border.all(color: Colors.orange,width: 1),shape: BoxShape.circle),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Container(width: 12,height: 12,decoration: BoxDecoration(color: Colors.orangeAccent,border: Border.all(color: Colors.orange,width: 1),shape: BoxShape.circle),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Container(width: 12,height: 12,decoration: BoxDecoration(color: Colors.orangeAccent,border: Border.all(color: Colors.orange,width: 1),shape: BoxShape.circle),),
                          ),
                          Text(" 4,188",style: TextStyle(color: Colors.grey.shade700,fontSize: 12),),
                        ],
                      ),
                      Text.rich(TextSpan(children: [
                        TextSpan(text: "79,899 ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.red)),
                        TextSpan(text: "84,900",style: TextStyle(fontSize: 12,color: Colors.grey.shade500,decoration: TextDecoration.lineThrough)),
                        TextSpan(text: " Save 5,001",style: TextStyle(fontSize: 12,color: Colors.grey.shade500)),
                        TextSpan(text: " (6%)",style: TextStyle(fontSize: 12,color: Colors.grey.shade500))
                      ])),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text.rich(
                              TextSpan(children: [
                                TextSpan(text: "Get it by ",style: TextStyle(fontSize: 12,color: Colors.grey.shade700)),
                                TextSpan(text: "Thrusday, Jul 22",style: TextStyle(fontSize: 14,color: Colors.grey.shade700,fontWeight: FontWeight.w700)),
                              ])
                          ),
                          SizedBox(width: 1,height: 8,),
                          Text("FREE DELIVERY",style: TextStyle(color: Colors.grey.shade500,fontSize: 12,fontWeight: FontWeight.w600),),
                        ],
                      ),
                    ],
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}




class CartProductCard extends StatefulWidget {
  const CartProductCard({Key? key}) : super(key: key);

  @override
  _CartProductCardState createState() => _CartProductCardState();
}

class _CartProductCardState extends State<CartProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 7.5),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Image.asset('assets/iphone-1.png',fit: BoxFit.contain,),
                ),
              ),
              Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("New Apple iPhone 12 (128GB) - Purple",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                      SizedBox(width: 1,height: 10,),
                      Text("79,899",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      SizedBox(width: 1,height: 5,),
                      Text("Eligible for FREE shipping"),
                      SizedBox(width: 1,height: 15,),
                      Text("In stock",style: TextStyle(color: Colors.green),),
                      Text.rich(TextSpan(children: [
                        TextSpan(text: "Color: ",style: TextStyle(fontWeight: FontWeight.w600)),
                        TextSpan(text: "Purple"),
                      ])),
                      Text.rich(TextSpan(children: [
                        TextSpan(text: "Pattern name: ",style: TextStyle(fontWeight: FontWeight.w600)),
                        TextSpan(text: "iPhone 12"),
                      ])),
                      Text.rich(TextSpan(children: [
                        TextSpan(text: "Size name: ",style: TextStyle(fontWeight: FontWeight.w600)),
                        TextSpan(text: "128GB"),
                      ])),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 1,height: 15,),
          Row(
            children: [
              Container(
                height: 40,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(7.5),border: Border.all(color: Colors.grey.shade400,width: 1)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Colors.grey.shade200,border: Border(right: BorderSide(color: Colors.grey.shade400,width: 1))),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Center(child: Icon(Icons.delete_outline,size: 20,)),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Center(child: Text("1",style: TextStyle(color: Colors.cyan,fontSize: 16),),),
                    ),
                    Container(
                      decoration: BoxDecoration(color: Colors.grey.shade200,border: Border(left: BorderSide(color: Colors.grey.shade400,width: 1))),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Center(child: Icon(Icons.add,size: 20,)),
                    ),
                  ],
                ),
              ),
              Expanded(child: SizedBox(),)
            ],
          ),
          SizedBox(width: 1,height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),),
                onPressed: () {  },
                child: Text("Delete",style: TextStyle(color: Colors.black),),
              ),
              SizedBox(width: 20,height: 1,),
              ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),),
                onPressed: () {  },
                child: Text("Save for later",style: TextStyle(color: Colors.black),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class WishlistProductCard extends StatelessWidget {
  const WishlistProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200,width: 1)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Image.asset('assets/iphone-1.png',fit: BoxFit.contain,),
            ),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("New Apple iPhone 12 (128GB) - Purple",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Container(width: 12,height: 12,decoration: BoxDecoration(color: Colors.orangeAccent,border: Border.all(color: Colors.orange,width: 1),shape: BoxShape.circle),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Container(width: 12,height: 12,decoration: BoxDecoration(color: Colors.orangeAccent,border: Border.all(color: Colors.orange,width: 1),shape: BoxShape.circle),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Container(width: 12,height: 12,decoration: BoxDecoration(color: Colors.orangeAccent,border: Border.all(color: Colors.orange,width: 1),shape: BoxShape.circle),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Container(width: 12,height: 12,decoration: BoxDecoration(color: Colors.orangeAccent,border: Border.all(color: Colors.orange,width: 1),shape: BoxShape.circle),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Container(width: 12,height: 12,decoration: BoxDecoration(color: Colors.orangeAccent,border: Border.all(color: Colors.orange,width: 1),shape: BoxShape.circle),),
                      ),
                      Text(" 4,188",style: TextStyle(color: Colors.grey.shade800,fontWeight: FontWeight.w600,fontSize: 14),),
                    ],
                  ),
                  Text("84,990",style: TextStyle(fontSize: 20),),
                  Text("Item added on 31st March 2019"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 35,
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                            color: Colors.amberAccent,borderRadius: BorderRadius.circular(7.5),
                          border: Border.all(width: 0.5,color: Colors.black),
                        ),
                        child: Center(child: Text("Add to Cart",style: TextStyle(fontSize: 14),),),
                      ),
                      SizedBox(width: 20,height: 1,),
                      Icon(Icons.delete_outline,size: 20,color: Colors.grey.shade900,),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class LiveOrderProductCard extends StatefulWidget {
  const LiveOrderProductCard({Key? key}) : super(key: key);

  @override
  _LiveOrderProductCardState createState() => _LiveOrderProductCardState();
}

class _LiveOrderProductCardState extends State<LiveOrderProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 7.5),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(7.5),border: Border.all(color: Colors.grey.shade400,width: 1)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(flex: 3,child: Image.asset('assets/iphone-1.png',fit: BoxFit.contain,),),
                  SizedBox(width: 30,height: 1,),
                  Expanded(flex: 7,child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("New Apple iPhone 12 (128GB) - Purple",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),maxLines: 2,),
                      SizedBox(width: 1,height: 10,),
                      Text("Delivery on 2nd August,21",style: TextStyle(fontSize: 14,color: Colors.grey.shade800),),
                      SizedBox(width: 1,height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.share,color: Colors.grey.shade700,size: 20,),
                          SizedBox(width: 10,height: 1,),
                          Text("Share this item",style: TextStyle(color: Colors.blue,fontSize: 16),),
                        ],
                      )
                    ],
                  ),)
                ],
              ),
            ),
            Container(height: 1,color: Colors.grey.shade300,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              child: Row(
                children: [
                  Expanded(child: Text("Buy it again",style: TextStyle(fontSize: 16),),),
                  Icon(Icons.arrow_forward_ios,size: 20,)
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}


class OfferProductCard extends StatefulWidget {
  const OfferProductCard({Key? key}) : super(key: key);

  @override
  _OfferProductCardState createState() => _OfferProductCardState();
}

class _OfferProductCardState extends State<OfferProductCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 20),
          child: Image.asset('assets/iphone-1.png',fit: BoxFit.contain,),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          child: Text("DISCOUNT OFFER",style: TextStyle(color: Colors.white,fontSize: 14),),
          color: Colors.red,
        ),
        SizedBox(width: 1,height: 10,),
        Text("12,499",style: TextStyle(fontSize: 16,color: Colors.red),),
        Text.rich(TextSpan(children: [
          TextSpan(text: "MRP: "),
          TextSpan(text: "15,000",style: TextStyle(decoration: TextDecoration.lineThrough)),
          TextSpan(text: "22% off")
        ])),
        SizedBox(width: 1,height: 15,),
        Text("New Apple iPhone 12 (128GB) - Purple",style: TextStyle(fontSize: 16),),
        SizedBox(width: 1,height: 30,),
        Text("Ends in 28;14",style: TextStyle(color: Colors.green),),
      ],
    );
  }
}


