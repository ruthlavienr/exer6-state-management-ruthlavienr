//Ruth Djusthine E. Tenifrancia
//U3L

//main file (responsible for routing)

import 'package:flutter/material.dart';
import 'screen/MyCart.dart';
import 'screen/MyCatalog.dart';
import 'screen/Checkout.dart';
import 'package:provider/provider.dart';
import 'provider/shoppingcart_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ShoppingCart()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/cart": (context) => const MyCart(),
        "/products": (context) => const MyCatalog(),
        "/checkout": (context) => const Checkout(),
      },
      home: const MyCatalog(),
    );
  }
}
