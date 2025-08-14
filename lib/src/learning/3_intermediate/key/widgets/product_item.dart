import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductItem extends StatefulWidget {
  const ProductItem(Key key, this.prodId, this.title, this.date) : super(key: key);

  final String prodId;
  final String title;
  final DateTime date;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  late Color myColor;

  @override
  void initState() {
    super.initState();

    List<Color> colors = [
      Colors.red,
      Colors.green, 
      Colors.blue,
      Colors.amber,
      Colors.purpleAccent,
      Colors.deepPurple,
      Colors.teal,
      Colors.lime,
    ];

    myColor = colors[Random().nextInt(colors.length)];
  }

  @override
  Widget build(BuildContext context) {
    var products = Provider.of<Products>(context, listen: false);
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: myColor,
      ),
      title: Text(widget.title),
      subtitle: Text(DateFormat.yMMMEd().format(widget.date)),
      trailing: IconButton(
        onPressed: () => products.deleteProduct(widget.prodId),
        icon: const Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ),
    );
  }
}
