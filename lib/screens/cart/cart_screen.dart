import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/base/views/base_view.dart';
import 'package:test_flutter/database/productDio.dart';
import 'package:test_flutter/model/dao/product_dao.dart';
import 'package:test_flutter/screens/product/ViewsModels/product_view_model.dart';
import 'package:test_flutter/screens/product/product_service.dart';
import 'package:test_flutter/utils/di.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_flutter/utils/silver_delegate_fixed_height.dart';
class CartScreen extends StatefulWidget {
 static const  String id="CartScreen";
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  void initState() {
    super.initState();
  }
  Future<bool> onWillPop(BuildContext context) async {
    Navigator.of(context).pop(true);
    return true;
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:() =>onWillPop(context),
      child: Consumer<ProductViewModel>(builder: (mContext,value,child){
        return _movieBuilder(context,value);
      },),
    );

  }

  Widget _movieBuilder(BuildContext context, ProductViewModel model) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: true,
        title: Padding(
          padding:  EdgeInsetsDirectional.only(start:6.w),
          child: Text("My Cart",style: TextStyle(fontWeight: FontWeight.w600),),
        ),
       leading: Padding(
         padding: const EdgeInsetsDirectional.only(end: 6.0),
         child: IconButton(onPressed: (){
           // back
           onWillPop(context);
         }, icon: Icon(Icons.arrow_back,size:32.h,color: Colors.white,)
         ),
       ),
      ),
      backgroundColor: Colors.white,
      body:
          Container(
            height: double.infinity,
            color: Colors.white,
            child: Column(children: [
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsetsDirectional.only(start: 16.w,end: 16.w,bottom: 20.h),
                    itemCount: model.allProductItemsList!.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index){
                      return Dismissible(
                        key: Key(model.allProductItemsList![index].name),
                        onDismissed: (direction) {
                          setState(() {
                            model.deleteItem(model.allProductItemsList![index].name);
                          });
                          // Then show a snackbar.
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text('${model.allProductItemsList![index].name.substring(0,20)} deleted'),backgroundColor: Colors.red,));
                        },
                        child:  itemProduct(model.allProductItemsList![index],context,model),
                      );


                    }),
              )
            ],),
          )

    );

  }

  Widget itemProduct(Product item,BuildContext context,ProductViewModel model) {
    return Container(
      height: 140.sp,
      width: MediaQuery.of(context).size.width,
      child: Card(
       shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0))),
        elevation: 10,
        child: Row(
          children: [
          Padding(
            padding:  EdgeInsets.only(top:8.0.h),
            child: Image.network(
              item.photoProduct,
              height:100.sp,
              width:100.sp ,
            fit: BoxFit.fill,
        ),

          ),
           Container(
             color: Colors.white,
             width:MediaQuery.of(context).size.width/2,
             margin: EdgeInsetsDirectional.only(top: 18,end: 20,bottom: 18,start: 10),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text(item.name.toString(),style: TextStyle(color: Colors.blueGrey,fontSize: 18.sp),overflow: TextOverflow.ellipsis,),
                 Padding(
                   padding: EdgeInsetsDirectional.only(start:0),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text("Price",style: TextStyle(color: Colors.blueGrey,fontSize: 16.sp),overflow: TextOverflow.ellipsis,),
                       Text( "${r"$"}"+item.price.toString(),style: TextStyle(color: Colors.blueGrey,fontSize: 16.sp),overflow: TextOverflow.ellipsis,),
                     ],
                   ),
                 ),
                 Padding(
                   padding: EdgeInsetsDirectional.only(start:0),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text("Quantity",style: TextStyle(color: Colors.blueGrey,fontSize: 16.sp),overflow: TextOverflow.ellipsis,),
                       Text( item.quantity.toString(),style: TextStyle(color: Colors.blueGrey,fontSize: 16.sp),overflow: TextOverflow.ellipsis,),
                     ],
                   ),
                 ),
               ],
             ),
           )

          ],
        ),
      ),
    );
  }




}
