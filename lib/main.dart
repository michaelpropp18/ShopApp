import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './models/products.dart';
import './models/cart.dart';
import './screens/cart_screen.dart';
import './models/orders.dart';
import './screens/orders_screen.dart';
import './screens/user_products_screen.dart';
import './screens/edit_product_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
          //use value for existing objects & lists
          //use create for new objectss
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
          //use value for existing objects & lists
          //use create for new objects
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
          //use value for existing objects & lists
          //use create for new objects
        ),
      ],
      child: MaterialApp(
        title: 'My Shop',
        theme: ThemeData(
          fontFamily: 'Lato',
          primarySwatch: Colors.blue,
          accentColor: Colors.yellow,
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
          UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
          EditProductScreen.routeName: (ctx) => EditProductScreen(),
        },
      ),
    );
  }
}
