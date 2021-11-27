


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/screens/cart/cart_screen.dart';

class Routers {

  static Route<dynamic> generateRoute(RouteSettings? settings) {
    switch (settings!.name) {
      case CartScreen.id:
        return MaterialPageRoute(
          builder: (_) =>
          CartScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
