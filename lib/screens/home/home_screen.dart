import 'package:flutter/material.dart';
import 'package:test_flutter/screens/login/login_screen.dart';
import 'package:test_flutter/utils/di.dart';
import 'package:test_flutter/utils/navigation_service.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      body: Center(
      
        child: Column(
         
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: (){
               getIt<NavigationService>().navigateTo(LoginScreen.id);
              },
              child: Text(
                'You have pushed the button this many times:',
              ),
            ),
            
          ],
        ),
      ), 
    );
  }
}
