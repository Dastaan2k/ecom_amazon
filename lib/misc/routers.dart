import 'package:ecom_amazon/misc/providers.dart';
import 'package:ecom_amazon/scenes/cart_page.dart';
import 'package:ecom_amazon/scenes/category_page.dart';
import 'package:ecom_amazon/scenes/deals_page.dart';
import 'package:ecom_amazon/scenes/home_page.dart';
import 'package:ecom_amazon/scenes/login_page.dart';
import 'package:ecom_amazon/scenes/wishlist_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../wrapper.dart';


class AppRoute {

  String url;

  AppRoute.home() : url = "";
  AppRoute.cart() : url = "cart";
  AppRoute.category() : url = "category";
  AppRoute.wishlist() : url = "wishlist";
  AppRoute.deals() : url = "deals";
  AppRoute.error() : url = "error";
  AppRoute.login() : url = "login";

}

class AppRouteInformationParser extends RouteInformationParser<AppRoute> {

  @override
  Future<AppRoute> parseRouteInformation(RouteInformation routeInformation) {

    Uri uri = Uri.parse(routeInformation.location!);

    print("Parsing route information : ${routeInformation.location}");

    if(uri.pathSegments.isEmpty) {
      return Future.value(AppRoute.home());
    }
    if(uri.pathSegments.length <= 1) {
      if(uri.pathSegments[0] == "category"){
        return Future.value(AppRoute.category());
      }
      else if(uri.pathSegments[0] == "cart"){
        return Future.value(AppRoute.cart());
      }
      else if(uri.pathSegments[0] == "wishlist"){
        return Future.value(AppRoute.wishlist());
      }
      else if(uri.pathSegments[0] == "deals"){
        return Future.value(AppRoute.deals());
      }
    }
    return Future.value(AppRoute.error());

  }

  @override
  RouteInformation? restoreRouteInformation(AppRoute route) {

    print("Restoring route information : ${route.url}");

    return RouteInformation(location: route.url);

  }

}

class PrimaryAppRouterDelegate extends RouterDelegate<AppRoute> with ChangeNotifier {

  late RouterProvider routerProvider;
  late GeneralProvider generalProvider;

  PrimaryAppRouterDelegate(BuildContext context) {
    routerProvider = Provider.of<RouterProvider>(context,listen: false);
    routerProvider.addListener(notifyListeners);
  }

  @override
  Widget build(BuildContext context) {

    print("Primary router delegate build");

    return Navigator(
      pages: [
        MaterialPage(child: Wrapper(),key: ValueKey("home")),
      ],
      onPopPage: (route,result) {

        //print("Pop route called");

        if (!route.didPop(result)) {
          return false;
        }

        return true;
      },
    );

  }

  @override
  Future<bool> popRoute() {
    print("Pop route called primary");
    return Future.value(true);
  }

  @override
  Future<void> setNewRoutePath(AppRoute configuration) async {
    // TODO: implement setNewRoutePath

  }


}



class SecondaryAppRouterDelegate extends RouterDelegate<AppRoute> with ChangeNotifier {

  late RouterProvider routerProvider;
  late GeneralProvider generalProvider;

  SecondaryAppRouterDelegate(BuildContext context) {
    routerProvider = Provider.of<RouterProvider>(context,listen: false);
    routerProvider.addListener(notifyListeners);
  }

  @override
  Widget build(BuildContext context) {

    print("Secondary router delegate build : ${routerProvider.currentPage}");

    Uri uri = Uri.parse(routerProvider.currentPage);

    return Navigator(
      pages: [
        MaterialPage(child: HomePage(),key: ValueKey("home")),
        if(uri.pathSegments.length >= 1)
          uri.pathSegments[0] == "category" ? MaterialPage(child: CategoryPage(),key: ValueKey("category")) :
          uri.pathSegments[0] == "wishlist" ? MaterialPage(child: WishlistPage(),key: ValueKey("wishlist")) :
          uri.pathSegments[0] == "cart" ? MaterialPage(child: CartPage(),key: ValueKey("cart")) :
          uri.pathSegments[0] == "deals" ? MaterialPage(child: DealsPage(),key: ValueKey("deals")) : MaterialPage(child: Container(color: Colors.yellow,),key: ValueKey("Error")),
      ],
      onPopPage: (route,result) {

        if (!route.didPop(result)) {
          return false;
        }

        return true;
      },
    );
  }

  @override
  Future<bool> popRoute() {
    print("Pop route called secondary");

    if(generalProvider.searchToggle) {
      generalProvider.searchToggle = false;
      generalProvider.notifyMyListener();
    }
    else {
      routerProvider.currentPage = "";
      routerProvider.notifyMyListener();
    }

    return Future.value(false);
  }

  @override
  Future<void> setNewRoutePath(AppRoute configuration) async {

    print("Setting new route path (Primary) : ${configuration.url}");

    routerProvider.currentPage = configuration.url;
    routerProvider.notifyMyListener();

  }


  @override
  get currentConfiguration {

    print("Getting current configuration(Primary) : ${routerProvider.currentPage} ");

    if(routerProvider.currentPage == ""){
      return AppRoute.home();
    }
    else if(routerProvider.currentPage == "category"){
      return AppRoute.category();
    }
    else if(routerProvider.currentPage == "wishlist"){
      return AppRoute.wishlist();
    }
    else if(routerProvider.currentPage == "cart"){
      return AppRoute.cart();
    }
    else if(routerProvider.currentPage == "deals"){
      return AppRoute.deals();
    }
  }



}

