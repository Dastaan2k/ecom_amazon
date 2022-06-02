import 'package:ecom_amazon/misc/providers.dart';
import 'package:ecom_amazon/scenes/cart_page.dart';
import 'package:ecom_amazon/scenes/category_page.dart';
import 'package:ecom_amazon/scenes/deals_page.dart';
import 'package:ecom_amazon/scenes/home_page.dart';
import 'package:ecom_amazon/scenes/login_page.dart';
import 'package:ecom_amazon/scenes/product_description_page.dart';
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
  AppRoute.product() : url = "product";

}

class AppRouteInformationParser extends RouteInformationParser<AppRoute> {

  @override
  Future<AppRoute> parseRouteInformation(RouteInformation routeInformation) {

    Uri uri = Uri.parse(routeInformation.location!);

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
      else if(uri.pathSegments[0] == "product") {
        return Future.value(AppRoute.product());
      }
    }
    return Future.value(AppRoute.error());

  }

  @override
  RouteInformation? restoreRouteInformation(AppRoute configuration) {
    return RouteInformation(location: configuration.url);
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
        MaterialPage(child: Wrapper(),key: const ValueKey("home")),
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

    Uri uri = Uri.parse(routerProvider.currentPage);

    return Navigator(
      pages: [
        const MaterialPage(child: HomePage(),key: ValueKey("home")),
        if(uri.pathSegments.isNotEmpty)
          uri.pathSegments[0] == "category" ? const MaterialPage(child: CategoryPage(),key: ValueKey("category")) :
          uri.pathSegments[0] == "wishlist" ? const MaterialPage(child: WishlistPage(),key: ValueKey("wishlist")) :
          uri.pathSegments[0] == "cart" ? const MaterialPage(child: CartPage(),key: ValueKey("cart")) :
          uri.pathSegments[0] == "deals" ? const MaterialPage(child: DealsPage(),key: ValueKey("deals")) :
          uri.pathSegments[0] == "product" ? const MaterialPage(child: ProductDescriptionPage(), key: ValueKey("product")): MaterialPage(child: Container(color: Colors.yellow,),key: const ValueKey("Error")),
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

    routerProvider.currentPage = configuration.url;
    routerProvider.notifyMyListener();

  }


  @override
  get currentConfiguration {

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
    else if(routerProvider.currentPage == "product") {
      return AppRoute.product();
    }
    return null;
  }



}

