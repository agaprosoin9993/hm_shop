import 'package:flutter/material.dart';

class ToastUtils{
  static void showTost(BuildContext context,String msg){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 120,
        backgroundColor: Colors.grey,
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 5),
        content: Text(msg,textAlign: TextAlign.center,),
      ),
    );
  }
}