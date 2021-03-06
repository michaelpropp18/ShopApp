import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/products.dart';
import 'product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool _onlyShowFavorites;

  const ProductsGrid(this._onlyShowFavorites);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final loadedProducts =
        _onlyShowFavorites ? productsData.favorites : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: loadedProducts.length,
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        value: loadedProducts[index],
        child: ProductItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
