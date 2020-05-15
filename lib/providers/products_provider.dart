import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductsProvider with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    return [... _items]; //copy
  }

  void addProduct() {
    //_items.add(product);
    notifyListeners();
  }
}