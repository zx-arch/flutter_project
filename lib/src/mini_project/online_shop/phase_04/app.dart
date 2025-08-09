import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/cart.dart';
import 'screens/carts_screen.dart';
import 'providers/all_products.dart';
import 'screens/product_details_screen.dart';
import 'screens/product_overviews_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
      ], 
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyShop',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: 'Lato',
      ),
      home: ProductOverviewsScreen(),
      routes: {
        ProductDetailsScreen.routeName: (ctx) => ProductDetailsScreen(),
        CartsScreen.routeName: (ctx) => CartsScreen(),
      },
    );
  }
}