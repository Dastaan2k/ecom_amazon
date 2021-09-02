import 'package:flutter/cupertino.dart';

class RouterProvider extends ChangeNotifier {

  String currentPage = "";

  var data;

  bool isLoggedIn = false;
  bool loginToggle = false;

  void notifyMyListener() {
    notifyListeners();
  }

}


class GeneralProvider extends ChangeNotifier {

  int appbarType = 0;    /// 0-Collapsable   1-Static Contracted   2-Static Expanded
  int appbarState = 1;   /// 0-Contracted    1-Expanded

  int preservedAppbarType = 0;
  int preservedAppbarState = 1;

  bool searchToggle = false;

  toggleSearch(bool value) {

    if(value) {
      preservedAppbarType = appbarType;
      preservedAppbarState = appbarState;
      appbarType = 2;
      appbarState = 1;
      searchToggle = true;
      notifyListeners();
    }
    else {
      appbarType = preservedAppbarType;
      appbarState = preservedAppbarState;
      searchToggle = false;
      notifyListeners();
    }

  }

  notifyMyListener() {
    notifyListeners();
  }

}
