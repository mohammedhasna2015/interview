import 'dart:convert';

import 'package:test_flutter/base/services/base_service.dart';
import 'package:test_flutter/model/dao/login_dao.dart';
import 'package:test_flutter/model/response_model.dart';
import 'package:test_flutter/utils/api_path.dart';

class LoginService {

  Future<ResponseModel> login({Map<String,dynamic>? data}) async {

    var response = await BaseService().postRequest(login_path,data,
        {});
    return response.isSuccess
        ? ResponseModel(data: LoginDao.fromJson(json.decode(response.data)))
        : ResponseModel(errorMessage: response.errorMessage, isSuccess: response.isSuccess);
  }
}