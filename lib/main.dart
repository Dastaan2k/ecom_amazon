import 'package:ecom_amazon/misc/providers.dart';
import 'package:ecom_amazon/misc/routers.dart';
import 'package:ecom_amazon/scenes/home_page.dart';
import 'package:ecom_amazon/test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


/*
TODO : Initialize appbar types and states for each page (in post frame callback).

Appbar not returning to contracted state when if its focused during transition

 */



void main() async {

 // WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

        return ChangeNotifierProvider<RouterProvider>(
          create: (BuildContext context)  => RouterProvider(),
          child: Builder(
            builder: (context) {
              return ChangeNotifierProvider(
                  create: (BuildContext context) => GeneralProvider(),
                  child: MaterialApp.router(routeInformationParser: AppRouteInformationParser(), routerDelegate: PrimaryAppRouterDelegate(context))
              );
            }
          )
        );

  }
}


