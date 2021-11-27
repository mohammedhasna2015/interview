import 'package:get_it/get_it.dart';
import 'package:test_flutter/screens/product/ViewsModels/product_view_model.dart';
import 'package:test_flutter/screens/product/product_service.dart';
import 'package:test_flutter/utils/navigation_service.dart';

var getIt=GetIt.instance;

void init(){
  getIt.registerLazySingleton(() => NavigationService());
  getIt.registerLazySingleton(() => ProductViewModel());
  getIt.registerLazySingleton(() => ProductService());

}