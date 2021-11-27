import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:test_flutter/base/viewmodels/base_view_model.dart';
import 'package:test_flutter/database/databaseCratore.dart';
import 'package:test_flutter/database/productDio.dart';
import 'package:test_flutter/model/dao/product_dao.dart';
import 'package:test_flutter/screens/product/product_service.dart';
import 'package:test_flutter/utils/api_path.dart';
import 'package:test_flutter/utils/di.dart';
import 'package:test_flutter/utils/shard.dart';

class ProductViewModel extends ChangeNotifier{

  ProductService? productService;
  String _productBox="productBox";
  List<ProductItem>? productItemsList=new List.empty(growable: true);
  List<String>? productItemsListLocal=new List.empty(growable: true);
  List<Product>? allProductItemsList=new List.empty(growable: true);

  int page =1;

 bool firstIsLoading=false;
  var box;
  late ScrollController controller;
 ProductViewModel({this.productService});
  Future<void> initScroll() async {
    controller = new ScrollController()..addListener(scrollListener);
  }
  void scrollListener() {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      getIt<ProductViewModel>().getAllProduct();
    }
  }


  addItem(ProductItem productItem) async {
    var box = await Hive.openBox<Product>(_productBox);
    Product item= new Product(name:productItem.title.toString(),
        price:productItem.price!.toDouble(),photoProduct: productItem.featuredImage!,quantity: 1);
    box.put(productItem.title,item);
    print('added');
    notifyListeners();
    getItem();
  }

  getItem() async {
    final box = await Hive.openBox<Product>(_productBox);
    productItemsListLocal=new List.empty(growable: true);
    allProductItemsList=new List.empty(growable: true);
    for(int i =0 ;i<box.values.toList().length;i++){
      productItemsListLocal!.add(box.values.toList()[i].name);
      allProductItemsList!.add(box.values.toList()[i]);
    }
    print("productItemsListLocal:"+productItemsListLocal!.length.toString());
    notifyListeners();
  }

  deleteItem(String name ) {
    final box = Hive.box<Product>(_productBox);

    box.delete(name);

    getItem();

    notifyListeners();
  }


  void getAllProduct() async{
    if(page==0){
      firstIsLoading=true;
      notifyListeners();
    }
    print("page"+page.toString());
    await  getIt<ProductService>().getAllProduct(path: all_product,body: {
        "page": page,
        "perPage": 5
      },
      header:{
        "Content-Type": "application/json",
        "token":"eyJhdWQiOiI1IiwianRpIjoiMDg4MmFiYjlmNGU1MjIyY2MyNjc4Y2FiYTQwOGY2MjU4Yzk5YTllN2ZkYzI0NWQ4NDMxMTQ4ZWMz"
      }).then((value) {
        if(page==0){
          firstIsLoading=false;
          notifyListeners();
        }
        if(value.isSuccess){
          ProductDao productDao =value.data;
          print("productDao.totalPage:"+productDao.totalPage.toString());
          if(productDao.totalPage!>=page){
            page++;
            if(productDao.data!=null&&productDao.data!.isNotEmpty){
              print("getAllProduct:"+productDao.data!.length.toString());
              if(productDao.data!.isNotEmpty){
                print("productItemsList:"+productDao.data!.length.toString());
                productItemsList!.addAll(productDao.data!);
                notifyListeners();
                if (controller.position.pixels == controller.position.maxScrollExtent) {
                  getIt<ProductViewModel>().getAllProduct();
                }
              }
            }
          }
        }else{
         firstIsLoading=false;
         notifyListeners();
        }
      });
    }


  bool searchItem(ProductItem productItem){
    Product item=  Product(name: productItem.title.toString(),
        price:productItem.price!.toDouble(),photoProduct: productItem.featuredImage!,quantity: 1);
    if(productItemsListLocal!.contains(item)){
      return true;
    }else{
      return false;
    }
  }

}