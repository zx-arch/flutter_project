import 'package:flutter/foundation.dart';

class CartItem {
  final String? id;
  final String? title;
  final double? price;
  int? qty = 0;

  CartItem({
    @required this.id, 
    @required this.title, 
    @required this.price, 
    @required this.qty
  });
}