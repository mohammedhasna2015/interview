import 'package:flutter/material.dart';
import 'package:test_flutter/base/views/base_view.dart';
import 'package:test_flutter/screens/login/login_service.dart';
import 'package:test_flutter/screens/login/viewModels/login_view_model.dart';

class LoginScreen extends StatefulWidget {
  static  const String id="LoginScreen";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(vmBuilder: (context)=>
        LoginViewModel(loginService: LoginService()), builder: _buildLoginScreen);
  }
  Widget _buildLoginScreen(BuildContext context, LoginViewModel viewModel) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child:
          ListView.builder(
            itemCount: 3,
              itemBuilder:(BuildContext context,int index ){
            return itemWidget(index,viewModel);
          })
      ),
    );
  }

  Widget itemWidget(int index, LoginViewModel viewModel) {
    return Container(child: Padding(
      padding: EdgeInsets.all(20.0),
      child: new Text(
        "This is a very bigggggggg text !!!",textDirection: TextDirection.ltr,
        style: new TextStyle(fontSize: 20.0, color: Colors.black),
        maxLines: 2,
      ),
    ),);
  }
}
