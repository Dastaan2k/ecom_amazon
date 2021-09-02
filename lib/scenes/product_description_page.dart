import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//TODO : Offer selection section (Expandable), Similar products list, Maybe change image page view width to constant


class ProductDescriptionPage extends StatefulWidget {

  const ProductDescriptionPage({Key? key}) : super(key: key);

  @override
  _ProductDescriptionPageState createState() => _ProductDescriptionPageState();
}

class _ProductDescriptionPageState extends State<ProductDescriptionPage> {

  late double width, height;
  int selectedImageIndex = 0;

  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: height,width: width,
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 10),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 7.5),
            child: Row(
              children: [
                const Expanded(child: SizedBox(),),
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
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 7.5),
            child: Text("New Apple iPhone 12 (128GB) - Pink",style: TextStyle(color: Colors.grey.shade800,fontSize: 18,fontWeight: FontWeight.w600),maxLines: 4,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 12.5),
            child: Column(                                                                /// IMAGE SECTION
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Stack(
                    children: [
                      Container(
                        width: width, height: width * 1.1,
                        //decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/iphone-1.png'),fit: BoxFit.contain)),
                        child: PageView(
                          onPageChanged: (index) {
                            setState(() {
                              selectedImageIndex = index;
                            });
                          },
                          children: [
                            Image.asset('assets/iphone-1.png',fit: BoxFit.contain,),
                            Container(color: Colors.red,),
                            Container(color: Colors.green,),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 10, left: 10,
                        child: Container(
                          width: 50,height: 50,decoration: BoxDecoration(color: Colors.red,shape: BoxShape.circle),
                          child: Center(child: Text("6%\n off",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),maxLines: 2,),),
                        ),
                      ),
                      Positioned(
                        top: 10, right: 10,
                        child: Container(
                          width: 40,height: 40,decoration: BoxDecoration(color: Colors.white.withOpacity(0.9),shape: BoxShape.circle),
                          child: Center(child: Icon(Icons.share_outlined,color: Colors.grey.shade700,size: 20,)),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(flex: 1,child: SizedBox(),),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(width: 10,height: 10,decoration: BoxDecoration(color: selectedImageIndex == 0 ? Colors.grey.shade500 : Colors.grey.shade200,border: Border.all(color: Colors.grey.shade500,width: 1),shape: BoxShape.circle),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(width: 10,height: 10,decoration: BoxDecoration(color: selectedImageIndex == 1 ? Colors.grey.shade500 : Colors.grey.shade200,border: Border.all(color: Colors.grey.shade500,width: 1),shape: BoxShape.circle),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(width: 10,height: 10,decoration: BoxDecoration(color: selectedImageIndex == 2 ? Colors.grey.shade500 : Colors.grey.shade200,border: Border.all(color: Colors.grey.shade500,width: 1),shape: BoxShape.circle),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(width: 10,height: 10,decoration: BoxDecoration(color: selectedImageIndex == 3 ? Colors.grey.shade500 : Colors.grey.shade200,border: Border.all(color: Colors.grey.shade500,width: 1),shape: BoxShape.circle),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(width: 10,height: 10,decoration: BoxDecoration(color: selectedImageIndex == 4 ? Colors.grey.shade500 : Colors.grey.shade200,border: Border.all(color: Colors.grey.shade500,width: 1),shape: BoxShape.circle),),
                    ),
                    Expanded(flex: 1,child: SizedBox(),),
                  ],
                ),
              ],
            ),
          ),
          Padding(                                                                /// PRICE SECTION
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 7.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("79,899",style: TextStyle(fontSize: 26),),
                Text.rich(TextSpan(children: [
                  TextSpan(text: "MRP: ",style: TextStyle(fontSize: 14,color: Colors.grey.shade800)),
                  TextSpan(text: "84,900",style: TextStyle(fontSize: 14,color: Colors.grey.shade700,decoration: TextDecoration.lineThrough)),
                  TextSpan(text: " Save 5,001",style: TextStyle(fontSize: 16,color: Colors.red))
                ])),
                SizedBox(width: 1,height: 10,),
                Text.rich(
                    TextSpan(children: [
                      TextSpan(text: "FREE delivery : ",style: TextStyle(color: Colors.cyan,fontSize: 14,fontWeight: FontWeight.w600),),
                      TextSpan(text: "Thrusday, Jul 22",style: TextStyle(fontSize: 14,color: Colors.grey.shade900,fontWeight: FontWeight.w700)),
                    ])
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(width: width,height: 4,color: Colors.grey.shade400,),
          ),
          Column(
            children: [
              categorySelector(),
              Container(width: width,height: 1.5,color: Colors.grey.shade400,),
              categorySelector(),
              Container(width: width,height: 1.5,color: Colors.grey.shade400,),
              categorySelector(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Container(width: width,height: 4,color: Colors.grey.shade400,),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15,bottom: 7.5),
            child: Text("In stock",style: TextStyle(color: Colors.green.shade700,fontSize: 18,fontWeight: FontWeight.w600),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 7.5),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      border: Border.all(color: Colors.grey,width: 0.5),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [BoxShadow(color: Colors.grey.shade400,blurRadius: 2)]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Qty: 1"),
                        Icon(Icons.keyboard_arrow_down,size: 20,),
                      ],
                    ),
                  ),
                ),
                Expanded(child: SizedBox(),)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 7.5),
            child: Container(
              width: width, height: 50,
              decoration: BoxDecoration(color: Colors.orange,borderRadius: BorderRadius.circular(10)),
              child: Center(child: Text("Buy Now",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 7.5),
            child: Container(
              width: width, height: 50,
              decoration: BoxDecoration(color: Colors.amberAccent,borderRadius: BorderRadius.circular(10)),
              child: Center(child: Text("Add to Cart",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7.5),
            child: Container(width: width,height: 4,color: Colors.grey.shade400,),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 7.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Details : ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                SizedBox(width: 1,height: 15,),
                Row(
                  children: [
                    Expanded(flex: 4,child: Text("Data 1"),),
                    Expanded(flex: 7,child: Text("Some text with a long description helo world"),),
                  ],
                ),
                SizedBox(width: 1,height: 5,),
                Row(
                  children: [
                    Expanded(flex: 4,child: Text("Data 1"),),
                    Expanded(flex: 7,child: Text("Some text with a long description helo world"),),
                  ],
                ),
                SizedBox(width: 1,height: 5,),
                Row(
                  children: [
                    Expanded(flex: 4,child: Text("Data 1"),),
                    Expanded(flex: 7,child: Text("Some text with a long description helo world"),),
                  ],
                ),
                SizedBox(width: 1,height: 5,),
                Row(
                  children: [
                    Expanded(flex: 4,child: Text("Data 1"),),
                    Expanded(flex: 7,child: Text("Some text with a long description helo world"),),
                  ],
                ),
              ],
            )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7.5),
            child: Container(width: width,height: 4,color: Colors.grey.shade400,),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 7.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Description : ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                  SizedBox(width: 1,height: 15,),
                  Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",maxLines: 5,)
                ],
              )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7.5),
            child: Container(width: width,height: 4,color: Colors.grey.shade400,),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 7.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Features : ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                  SizedBox(width: 1,height: 15,),
                  Text(" - Feature 1 "),
                  SizedBox(width: 1,height: 5,),
                  Text(" - Feature 2 "),
                  SizedBox(width: 1,height: 5,),
                  Text(" - Feature 3 "),
                  SizedBox(width: 1,height: 5,),
                  Text(" - Feature 4 "),
                ],
              )
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 7.5),
            child: Container(width: width,height: 4,color: Colors.grey.shade400,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 7.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7.5),
                  child: Text("Customer reviews",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7.5),
                  child: startPlaceholder(),
                ),
                Text("4,191 global ratings",style: TextStyle(color: Colors.grey.shade700,fontSize: 14),),
              ],
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
                Row(
                  children: [
                    Expanded(flex: 4,child: Text("Feature 1"),),
                    Expanded(flex: 7,child: startPlaceholder()),
                  ],
                ),
                SizedBox(width: 1,height: 5,),
                Row(
                  children: [
                    Expanded(flex: 4,child: Text("Feature 2"),),
                    Expanded(flex: 7,child: startPlaceholder()),
                  ],
                ),
                SizedBox(width: 1,height: 5,),
                Row(
                  children: [
                    Expanded(flex: 4,child: Text("Feature 3"),),
                    Expanded(flex: 7,child: startPlaceholder()),
                  ],
                ),
                SizedBox(width: 1,height: 5,),
                Row(
                  children: [
                    Expanded(flex: 4,child: Text("Feature 4"),),
                    Expanded(flex: 7,child: startPlaceholder()),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 7.5),
            child: Container(width: width,height: 1.5,color: Colors.grey.shade400,),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 7.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7.5),
                  child: Text("Top reviews",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                ),
                SizedBox(width: 1,height: 10,),
                reviewCard(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget reviewCard() {

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(width: 40,height: 40,decoration: BoxDecoration(color: Colors.grey.shade600,shape: BoxShape.circle),),
              Text("  Profile Name",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),)
            ],
          ),
          SizedBox(width: 1,height: 10,),
          startPlaceholder(),
          SizedBox(width: 1,height: 10,),
          Text("Review title",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
          Text("Reviewd on 5 Jul, 22",style: TextStyle(fontSize: 14,color: Colors.grey.shade700),),
          SizedBox(width: 1,height: 10),
          Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."),
          SizedBox(width: 1,height: 10,),
          Text("1,700 people found this review helpful",style: TextStyle(fontSize: 14,color: Colors.grey.shade700,fontWeight: FontWeight.w600),),
          SizedBox(width: 1,height: 10,),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),),
                onPressed: () {  },
                child: Text("Helpful",style: TextStyle(color: Colors.black),),
              ),
              SizedBox(width: 20,height: 1,),
              ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),),
                onPressed: () {  },
                child: Text("Report",style: TextStyle(color: Colors.black),),
              ),
            ],
          ),
        ],
      ),
    );

  }

  Widget startPlaceholder(){
    return Row(
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
        Text(" 5 out of 5",style: TextStyle(color: Colors.grey.shade700,fontWeight: FontWeight.w600,fontSize: 14),),
      ],
    );
  }


  Widget categorySelector() {

    return Container(
      width: width,height: 90,
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Color: ",style: TextStyle(fontSize: 14),),
              Text("Purple",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            ],
          ),
          const Expanded(child: SizedBox(),),
          Image.asset('assets/iphone-1.png'),
          SizedBox(width: 20,height: 1,),
          Icon(Icons.keyboard_arrow_down,size: 24,),
        ],
      ),
    );

  }

}
