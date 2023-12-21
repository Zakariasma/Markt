import 'package:flutter/material.dart';
import 'package:markt/domain/productDTO.dart';
import 'package:markt/middleware/route_guard.dart';
import 'package:markt/page/conversation.dart';
import 'package:markt/page/create_product.dart';
import 'package:markt/page/home_page.dart';
import 'package:markt/page/inscription.dart';
import 'package:markt/page/lobby_chat.dart';
import 'package:markt/page/login.dart';
import 'package:markt/page/modify_draft.dart';
import 'package:markt/page/product_page.dart';
import 'package:markt/page/profil.dart';
import 'package:markt/token/token_manage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final RouteGuard routeGuard = RouteGuard();

    return MaterialApp(
      title: 'SQUARE',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: "Roboto",
      ),
      navigatorObservers: [routeGuard],
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => HomePage());
          case '/createProduct':
            return MaterialPageRoute(builder: (context) => CreateProduct());
          case '/lobby':
            return MaterialPageRoute(builder: (context) => LobbyChat());
          case '/profil':
            return MaterialPageRoute(builder: (context) => Profil());
          case '/login':
            return MaterialPageRoute(builder: (context) => Login());
          case '/inscription':
            return MaterialPageRoute(builder: (context) => Inscription());
          case '/editdraft':
            ProductDTO productDTO = settings.arguments as ProductDTO;
            return MaterialPageRoute(builder: (context) => ModifyDraft(productDTO: productDTO));
          default:
            return MaterialPageRoute(builder: (context) => HomePage());
        }
      },
    );
  }
}
