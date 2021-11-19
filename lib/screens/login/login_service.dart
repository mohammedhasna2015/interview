import 'dart:convert';

import 'package:test_flutter/base/services/base_service.dart';
import 'package:test_flutter/model/dao/login_dao.dart';
import 'package:test_flutter/model/response_model.dart';
import 'package:test_flutter/utils/api_path.dart';

class LoginService {

  Future<ResponseModel> login(String phoneNumber) async {

    var response = await BaseService().postRequest("/api/method/ash7anly.auth1.login",{"phone":"505632750", "msg_via": "sms"},
        {});
    return response.isSuccess
        ? ResponseModel(data: LoginDao.fromJson(json.decode(response.data)))
        : ResponseModel(errorMessage: response.errorMessage, isSuccess: response.isSuccess);
  }
}