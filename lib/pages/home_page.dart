import 'package:CreditCard/widgets/my_app_bar.dart';
import 'package:CreditCard/widgets/panel_top.dart';
import 'package:CreditCard/widgets/item_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        alignment: Alignment.topCenter,
        children: [
          MyAppBar(),
          PanelTop(),
          PageView(
            controller: _pageController,
            children: [
              ItemPage(),
              ItemPage(),
              ItemPage(),
            ],
          ),
        ],
      )),
    );
  }
}
