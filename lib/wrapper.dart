import 'package:ecom_amazon/misc/providers.dart';
import 'package:ecom_amazon/misc/routers.dart';
import 'package:ecom_amazon/widgets/appbar.dart';
import 'package:ecom_amazon/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'misc/data.dart';

class Wrapper extends StatelessWidget {

  late double height, width;
  late BackButtonDispatcher _backButtonDispatcher;

  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    _backButtonDispatcher = Router.of(context).backButtonDispatcher!.createChildBackButtonDispatcher();
    _backButtonDispatcher.takePriority();

    return SafeArea(
      child: Scaffold(
        key: Data.scaffoldKey,
        drawer: SideDrawer(),
        body: SizedBox(
          height: height, width: width,
          child: Column(
            children: [
              const CustomAppbar(),
              Expanded(
                  child: Stack(
                    children: [
                      Router(routerDelegate: SecondaryAppRouterDelegate(context),backButtonDispatcher: _backButtonDispatcher,),
                      Consumer<GeneralProvider>(
                          builder: (context,provider,child){
                            return provider.searchToggle ? Container(color: Colors.white,) : Container();
                          }
                        )
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
