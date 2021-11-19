import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_flutter/base/viewmodels/base_view_model.dart';
import 'package:test_flutter/screens/login/login_service.dart';
import 'package:test_flutter/utils/di.dart';
import 'package:test_flutter/utils/navigation_service.dart';

class LoginViewModel extends BaseViewModel{

  LoginService? loginService;

  LoginViewModel({this.loginService});

  @override
  FutureOr<void> init() {
    login();
  }

  
  void login(){
    loginService!.login("505632750").then((value) {
      if(value.isSuccess){
        print("login:success");
        ScaffoldMessenger.of(getIt<NavigationService>().navigatorKey.currentContext!)
            .showSnackBar(SnackBar(content: Text("success")));
      }else{
        print("login:error:"+value.errorMessage);
      }
    });
  }
}