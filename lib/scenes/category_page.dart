import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  late double height, width;

  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: height, width: width,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text("Shop by Category",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              padding: EdgeInsets.only(bottom: 20,left: 20,right: 20),
              scrollDirection: Axis.vertical,
              children: List.generate(7, (index) => Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.grey.shade300,borderRadius: BorderRadius.circular(15)),
                width: width * 0.4,height: width * 0.4,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5,),
                    child: Text("Label",style: TextStyle(fontSize: 16),),
                  ),
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
