import 'dart:io';
import 'package:hive/hive.dart';
part 'productDio.g.dart';
@HiveType(typeId: 1)
class Product {
  Product({required this.name, required this.price, required this.photoProduct,required this.quantity});
  @HiveField(0)
  String name;

  @HiveField(1)
  double price;

  @HiveField(2)
  String photoProduct;

  @HiveField(3)
  int quantity;

  @override
  String toString() {
    return '$name: $name';
  }
}