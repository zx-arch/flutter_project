import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class Cart with ChangeNotifier {
  final Map<String, CartItem> _items = {};
  Map<String, CartItem> get items => _items;

  int get itemCount { 
    return _items.length;
  }

  double get totalPrice {
    var total = 0.0;
    _items.forEach((key, value) {
      total += (value.price ?? 0) * (value.qty ?? 0);
    });
    return total;
  }

  void addCart(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      _items.update(productId, (value) => CartItem(
        id: value.id,
        title: value.title,
        price: value.price,
        qty: (value.qty ?? 0) + 1
      ));
    } else {
      _items.putIfAbsent(productId, () => CartItem(
        id: DateTime.now().toString(), 
        title: title, 
        price: price, 
        qty: 1
      ));
    }
    notifyListeners();
  }
}