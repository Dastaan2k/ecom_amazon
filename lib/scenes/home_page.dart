import 'package:ecom_amazon/misc/providers.dart';
import 'package:ecom_amazon/scenes/cart_page.dart';
import 'package:ecom_amazon/widgets/product_cards.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool pseudoInitState = true;


  late Widget _futureWidget;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureWidget = FutureBuilder(
      initialData: "Hello",
      future: asyncFunc(),
      builder: (context,future) {
        if(future.connectionState == ConnectionState.waiting){
          return Text("Waiting ...");
        }
        else {
          return Consumer<RouterProvider>(
              builder: (context,provider,child) => InkWell(onTap: () {provider.currentPage = "cart";provider.notifyMyListener();}, child: Text("Home"))
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    print("Home build");

    if(pseudoInitState) {
      pseudoInitState = false;
    }

    return Material(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        children: List.generate(6, (index) => const ProductCard()),
      ),
    );
  }


  Future<String> asyncFunc() {
    print("Executing async function ...");
    return Future.value("Home");
  }
}
