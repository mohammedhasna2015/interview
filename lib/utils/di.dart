import 'package:get_it/get_it.dart';
import 'package:test_flutter/utils/navigation_service.dart';

var getIt=GetIt.instance;

void init(){
  getIt.registerLazySingleton(() => NavigationService());
}