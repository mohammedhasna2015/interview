import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/screens/product/ViewsModels/product_view_model.dart';
import 'package:test_flutter/screens/product/product_screen.dart';
import 'package:test_flutter/utils/di.dart';
import 'package:test_flutter/utils/navigation_service.dart';
import 'package:test_flutter/utils/router.dart';

import 'database/databaseCratore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  init();
 await DataBaseCreator().initDataBase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(414, 887),
        builder: () => MultiProvider(
          providers: [
            ChangeNotifierProvider.value(value: getIt<ProductViewModel>())
          ],
          child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
      ),
      navigatorKey:getIt<NavigationService>().navigatorKey ,
      home: ProductScreen(),
      onGenerateRoute: Routers.generateRoute,
    ),
        ));
  }
}
