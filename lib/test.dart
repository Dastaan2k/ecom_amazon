import 'package:ecom_amazon/scenes/cart_page.dart';
import 'package:ecom_amazon/scenes/deals_page.dart';
import 'package:ecom_amazon/scenes/orders_page.dart';
import 'package:ecom_amazon/scenes/product_description_page.dart';
import 'package:ecom_amazon/widgets/product_cards.dart';
import 'package:flutter/material.dart';

import 'scenes/category_page.dart';
import 'scenes/product_list_page.dart';
import 'scenes/wishlist_page.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DealsPage(),/*ListView(
        padding: const EdgeInsets.only(top: 10),
        children: List.generate(5, (index) => const WishlistProductCard()),
      ),*/
    );
  }
}
