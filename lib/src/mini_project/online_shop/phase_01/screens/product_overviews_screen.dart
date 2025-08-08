import 'package:flutter/material.dart';

import '../widgets/product_grid.dart';

class ProductOverviewsScreen extends StatelessWidget {
  const ProductOverviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
      ),
      body: const ProductGrid(),
    );
  }
}