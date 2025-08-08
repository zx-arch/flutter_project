import 'package:flutter/material.dart';
import '../screens/product_details_screen.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (context, product, child) => IconButton(
              icon: product.isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border_outlined),
              color: Colors.amber,
              onPressed: () {
                product.statusFav();
              },
            )
          ),
          title: Text(
            product.title ?? '',
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
            color: Colors.amber,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailsScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl ?? '',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}