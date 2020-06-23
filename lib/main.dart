import 'package:CreditCard/controllers/page_controller.dart';
import 'package:CreditCard/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
     SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
     );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Credit Card',
  theme: ThemeData.dark(),
  
      home: ChangeNotifierProvider( create: (_) => PageControllerApp() ,
      
      child: HomePage()),
    );
  }
}
