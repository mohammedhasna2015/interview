import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_flutter/database/productDio.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

class DataBaseCreator {

  var box;
  initDataBase() async {
    Directory directory = await pathProvider.getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    Hive.registerAdapter(ProductAdapter());

  }


}