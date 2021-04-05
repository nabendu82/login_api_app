import 'package:flutter/material.dart';
import 'package:login_api_app/pages/home_page.dart';
import 'package:login_api_app/pages/login_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
    theme: ThemeData(primarySwatch: Colors.orange),
    routes: {
        LoginPage.routeName : (context) => LoginPage(),
        HomePage.routeName : (context) => HomePage()
    }
  ));
}