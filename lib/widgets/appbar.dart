import 'package:ecom_amazon/misc/data.dart';
import 'package:ecom_amazon/misc/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppbar extends StatefulWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  _CustomAppbarState createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {

  bool pseudoInitState = true;

  late double width;
  late GeneralProvider generalProvider;

  @override
  Widget build(BuildContext context) {

    if(pseudoInitState) {
      width = MediaQuery.of(context).size.width;
      generalProvider = Provider.of<GeneralProvider>(context);
      pseudoInitState = false;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: width, height: generalProvider.appbarType == 2 ? 80 + 65 : generalProvider.appbarType == 1 ? 65 :  generalProvider.appbarState == 0 ? 65 : 80 + 65,
      color: Colors.cyanAccent,
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          SizedBox(
            height: 60,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: InkWell(
                      onTap: () {
                        Data.scaffoldKey.currentState!.openDrawer();
                      },
                      child: const Icon(Icons.dehaze_rounded,size: 24,)
                  ),
                ),
                const Expanded(child: Align(alignment: Alignment.centerLeft,child: Text("Amazon",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),),),
                generalProvider.appbarState == 0 ? Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: InkWell(
                    onTap: () {
                      generalProvider.toggleSearch(!generalProvider.searchToggle);
                    },
                    child: const Icon(Icons.search,size: 20,),
                  ),
                ) : const SizedBox(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Consumer<RouterProvider>(
                    builder: (context,provider,child) {

                      return InkWell(
                        onTap: () {
                          provider.currentPage = "cart";
                          provider.notifyMyListener();
                        },
                        child: child,
                      );

                    },
                    child: const Icon(Icons.add_shopping_cart,size: 20),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: SizedBox(
              height: 50,width: width,
              child: TextField(
                onTap: () {
                  generalProvider.toggleSearch(true);
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search,color: Colors.black,),
                  suffixIcon: const Icon(Icons.camera_alt_outlined,color: Colors.black,),
                  filled: true, enabled: true,
                  fillColor: Colors.grey.shade200,
                  hintText: "Search here",
                  hintStyle: TextStyle(color: Colors.grey.shade400,fontSize: 14),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.grey.shade400,width: 1)),
                ),
              ),
            )
            )
        ],
      )
    );
  }
}
