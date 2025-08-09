import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../screens/carts_screen.dart';
import '../providers/all_products.dart';
import '../widgets/badge.dart' as custom;

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final product = Provider.of<Products>(context).findById(productId);
    final cart = Provider.of<Cart>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
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
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 250,
            child: Image.network(
              "${product.imageUrl}",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 15),
          Text(
            "${product.title}",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15),
          Text(
            "\$${product.price}",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          SizedBox(height: 15),
          Text(
            "${product.description}",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          SizedBox(height: 15),
          OutlinedButton(
            onPressed: () {
              cart.addCart(product.id ?? '', product.title ?? '', product.price ?? 0.0);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Berhasil menambahkan produk ke keranjang'),
                  duration: Duration(seconds: 2),
                ),
              );
              Navigator.of(context).pushNamed(
                CartsScreen.routeName,
              );
            }, 
            child: Text(
              'Add to Cart',
              style: TextStyle(
                fontSize: 24
              ),
            ),
          )
        ],
      ),
    );
  }
}