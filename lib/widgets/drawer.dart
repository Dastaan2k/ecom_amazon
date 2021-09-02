import 'package:ecom_amazon/misc/data.dart';
import 'package:ecom_amazon/misc/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideDrawer extends StatelessWidget {

  late double width,height;
  late RouterProvider _routerProvider;

  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    _routerProvider = Provider.of<RouterProvider>(context);

    return Container(
      width: width * 0.8, height: height,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: width * 0.8, height: 80,
            color: Colors.cyanAccent,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Container(width: 40,height: 40,decoration: BoxDecoration(color: Colors.grey.shade300,shape: BoxShape.circle),),
                    const SizedBox(width: 20,height: 1,),
                    InkWell(
                      onTap: () {
                        if(_routerProvider.isLoggedIn) {
                          _routerProvider.isLoggedIn = false;
                          _routerProvider.notifyMyListener();
                        }
                        else {
                          _routerProvider.loginToggle = true;
                          _routerProvider.notifyMyListener();
                        }
                      },
                        child: Text(_routerProvider.isLoggedIn ? "Hello, Daastan2k" : "Login",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),)
                    )
                  ],
                )
            ),
          ),
          InkWell(
              onTap: () {
                _routerProvider.currentPage = "";_routerProvider.notifyMyListener();
                Navigator.of(context).pop();
                },
              child: drawerButton("Home")
          ),
          InkWell(
              onTap: () {
                _routerProvider.currentPage = "cart";_routerProvider.notifyMyListener();
                Navigator.of(context).pop();
              },
              child: drawerButton("My Cart")
          ),
          InkWell(
              onTap: () {
                _routerProvider.currentPage = "wishlist";_routerProvider.notifyMyListener();
                Navigator.of(context).pop();
              },
              child: drawerButton("My Wishlist")
          ),
          InkWell(
              onTap: () {
                _routerProvider.currentPage = "category";_routerProvider.notifyMyListener();
                Navigator.of(context).pop();
              },
              child: drawerButton("Shop by Category")
          ),
          InkWell(
              onTap: () {
                _routerProvider.currentPage = "deals";_routerProvider.notifyMyListener();
                Navigator.of(context).pop();
              },
              child: drawerButton("Deals")
          ),
        ],
      ),
    );
  }

  Widget drawerButton(String text) {

    return Container(
      width: width * 0.8, height: 60,
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300,width: 1))),
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
      child: Align(alignment: Alignment.centerLeft,child: Text(text,style: TextStyle(fontSize: 16),),),
    );

  }
}
