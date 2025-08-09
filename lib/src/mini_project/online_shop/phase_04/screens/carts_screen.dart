import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartsScreen extends StatelessWidget {
  const CartsScreen({super.key});
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carts'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(10),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                "\$${cartData.totalPrice.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 18),
              ),
            )
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartData.items.length,
              itemBuilder: (ctx, i) => ListTile(
                title: Text(cartData.items.values.toList()[i].title.toString()),
                subtitle: Text("qty: ${cartData.items.values.toList()[i].qty.toString()}"),
                trailing: Text("\$${(cartData.items.values.toList()[i].price! * cartData.items.values.toList()[i].qty!).toStringAsFixed(2)}"),
              )
            )
          )
        ],
      ),
    );
  }
}