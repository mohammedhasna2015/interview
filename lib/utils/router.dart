


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/screens/login/login_screen.dart';

class Routers {

  static Route<dynamic> generateRoute(RouteSettings? settings) {
    switch (settings!.name) {
      case LoginScreen.id:
        return MaterialPageRoute(
          builder: (_) =>
          LoginScreen(),
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
