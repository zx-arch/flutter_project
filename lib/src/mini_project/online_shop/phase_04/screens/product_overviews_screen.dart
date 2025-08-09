import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/badge.dart' as custom;
import '../widgets/product_grid.dart';
import '../screens/carts_screen.dart';
import '../providers/cart.dart';

class ProductOverviewsScreen extends StatelessWidget {
  const ProductOverviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          Consumer<Cart>(
            builder: (context, value, ch) {
              return custom.Badge(
                value: value.items.length.toString(),
                child: ch!,
              );
            },
            child: IconButton(
              icon: const Icon(Icons.shopping_cart), 
              onPressed: () {
                Navigator.of(context).pushNamed(
                  CartsScreen.routeName,
                );
              }
            )
          )
          // custom.Badge(
          //   value: "0",
          //   child: IconButton(
          //     icon: const Icon(Icons.shopping_cart), 
          //     onPressed: () {
          //       Navigator.of(context).pushNamed(
          //         CartsScreen.routeName,
          //       );
          //     }
          //   )
          // )
        ],
      ),
      body: const ProductGrid(),
    );
  }
}