import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_flutter/utils/api_path.dart';

class BaseService {
  static BaseService _instance = new BaseService.internal();
  static final String baseUrl ="https://app.rasseed.com" ;

  BaseService.internal();

  factory BaseService() => _instance;

  Future<ServiceResponseModel> getRequest(String path, {int timeOut = 30}) async {
    // i can add here check connectivity
    try {
      return http.get(Uri.parse("$baseUrl$path")).timeout(Duration(seconds: timeOut)).then((http.Response response) async {
        int statusCode = response.statusCode;
        if (statusCode == 200) {
          return ServiceResponseModel(isSuccess: true, data: response.body);
        } else {
          return ServiceResponseModel(errorMessage: "Connection failed by $statusCode code.");
        }
      });
    } catch (e) {
      return ServiceResponseModel(errorMessage: "Undefined problem happened!");
    }
  }
  Future<ServiceResponseModel> postRequest(String? path,Map<String,dynamic>? body,Map<String,String>? header, {int timeOut = 30}) async {
    // i can add here check connectivity
    try {
      return http.post(Uri.parse("$baseUrl$path"),body: json.encode(body),headers: header).timeout(Duration(seconds: timeOut)).then((http.Response response) async {
        int statusCode = response.statusCode;
        if (statusCode == 200) {
          print("postRequest:success");
          return ServiceResponseModel(isSuccess: true, data: response.body);
        } else {
          print("postRequest:error");
          return ServiceResponseModel(errorMessage: "Connection failed by $statusCode code.");
        }
      });
    } catch (e) {
      print("postRequest:exception");
      return ServiceResponseModel(errorMessage: "Undefined problem happened!");
    }
  }
}

class ServiceResponseModel {
  final bool isSuccess;
  final dynamic errorMessage;
  final dynamic data;

  ServiceResponseModel({this.isSuccess = false, this.errorMessage, this.data});
}
