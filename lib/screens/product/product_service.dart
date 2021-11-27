import 'dart:convert';

import 'package:test_flutter/base/services/base_service.dart';
import 'package:test_flutter/model/dao/product_dao.dart';
import 'package:test_flutter/model/response_model.dart';

class ProductService {
  Future<ResponseModel> getAllProduct({String? path,Map<String,dynamic>? body,Map<String,String>? header}) async {
    var response = await BaseService().postRequest(body: body,header: header,path: path);
    return response.isSuccess
        ? ResponseModel(data: ProductDao.fromJson(json.decode(response.data)))
        : ResponseModel(errorMessage: response.errorMessage, isSuccess: response.isSuccess);
  }


}