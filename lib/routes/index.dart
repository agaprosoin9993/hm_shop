import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Login/index.dart';
import 'package:hm_shop/pages/Main/index.dart';

Widget getRootWidget(){
  return MaterialApp(
    initialRoute: '/',
    routes: getRoutes(),
  );
}
Map<String, Widget Function(BuildContext)> getRoutes(){
  return {
    '/': (context) => MainPage(),
    '/login': (context) => LoginPage(),
  };
}