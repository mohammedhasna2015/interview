import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/base/views/base_view.dart';
import 'package:test_flutter/database/databaseCratore.dart';
import 'package:test_flutter/database/productDio.dart';
import 'package:test_flutter/model/dao/product_dao.dart';
import 'package:test_flutter/screens/cart/cart_screen.dart';
import 'package:test_flutter/screens/product/ViewsModels/product_view_model.dart';
import 'package:test_flutter/screens/product/product_service.dart';
import 'package:test_flutter/utils/di.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_flutter/utils/navigation_service.dart';
import 'package:test_flutter/utils/silver_delegate_fixed_height.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  var box;

  @override
  void initState() {
    super.initState();
    getIt<ProductViewModel>().initScroll();
    getIt<ProductViewModel>().getAllProduct();
    getIt<ProductViewModel>().getItem();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductViewModel>(
      builder: (mContext, value, child) {
        return _movieBuilder(context, value);
      },
    );
  }

  Widget _movieBuilder(BuildContext context, ProductViewModel model) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: true,
          title: Padding(
            padding: EdgeInsetsDirectional.only(start: 6.w),
            child: Text(
              "Shopping Mall",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 6.0),
              child:
              new Stack(
                children: <Widget>[
                  IconButton(
                  onPressed: () {
        // go to cart
        getIt<NavigationService>().navigateTo(CartScreen.id);
  },
    icon: Icon(
    Icons.shopping_cart,
    size: 32.h,
    color: Colors.white,
    )),
                  new Positioned(
                    left: 10,
                    child: new Container(
                      padding: EdgeInsets.all(1),
                      decoration: new BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: BoxConstraints(
                        minWidth: 15,
                        minHeight: 15,
                      ),
                      child: new Text(
                        '${model.allProductItemsList!.length.toString()}',
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: Container(
          height: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                    padding: EdgeInsetsDirectional.only(
                        start: 16.w, end: 16.w, bottom: 20.h),
                    itemCount: model.productItemsList!.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    controller: model.controller,
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                            crossAxisCount: 2,
                            height: 200.sp,
                            crossAxisSpacing: 7.h,
                            mainAxisSpacing: 7.h),
                    itemBuilder: (BuildContext context, int index) {
                      return itemProduct(
                          model.productItemsList![index], context, model);
                    }),
              )
            ],
          ),
        ));
  }

  Widget itemProduct(
      ProductItem item, BuildContext context, ProductViewModel model) {
    return Container(
      height: 190.sp,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        elevation: 10,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.0.h),
              child: Image.network(
                item.featuredImage!,
                height: 120.sp,
                width: 120.sp,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 8.0),
                        child: SizedBox(
                          width: 120.w,
                          child: Text(
                            item.title.toString(),
                            style: TextStyle(
                                color: Colors.blueGrey, fontSize: 16.sp),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                           if(model.productItemsListLocal!.contains(item.title)){
                             model.deleteItem(item.title!);
                           }else{
                             model.addItem(item);
                           }
                          },
                          icon: model.productItemsListLocal!.contains(item.title)
                              ? Icon(
                                  Icons.shopping_cart,
                                  size: 28.sp,
                                  color: Colors.deepOrange,
                                )
                              : Icon(
                                  Icons.shopping_cart,
                                  size: 28.sp,
                                  color: Colors.grey,
                                )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
