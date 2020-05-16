import 'package:flutter/material.dart';

class Cart {
  Map<String, CartItem> _items;

  Map<String, CartItem> get items {
    return {..._items};
  }

  void addItem(String id, double price, String title) {
    if (_items.containsKey(id)) {
      _items.update(
        id,
        (previous) => CartItem(
            id: previous.id,
            title: previous.title,
            quantity: previous.quantity + 1,
            price: previous.price),
      );
    } else {
      _items.putIfAbsent(
        id,
        () => CartItem(
            id: DateTime.now().toString(),
            title: title,
            quantity: 1,
            price: price),
      );
    }
  }
}

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {@required this.id,
      @required this.title,
      @required this.quantity,
      @required this.price});
}
