import 'package:flutter/material.dart';
import 'package:markt/page/home_page.dart';
import 'package:markt/page/product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQUARE',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: "Roboto",
      ),
      routes: {
        '/': (context) => HomePage(),
        '/product': (context) => ProductPage(),
      },
    );
  }
}


