import 'package:flutter/material.dart';
import 'package:test_flutter/screens/home/home_screen.dart';
import 'package:test_flutter/utils/di.dart';
import 'package:test_flutter/utils/navigation_service.dart';
import 'package:test_flutter/utils/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey:getIt<NavigationService>().navigatorKey ,
      home: HomeScreen(title: 'Flutter Demo Home Page'),
      onGenerateRoute: Routers.generateRoute,
    );
  }
}
