import 'package:flutter/material.dart';

class ToastUtils{
  static bool showLoading = false;
  static void showTost(BuildContext context,String msg){
    if(showLoading){
      return;
    }
    showLoading = true;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 180,
        backgroundColor: Colors.grey,
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 5),
        content: Text(msg,textAlign: TextAlign.center,),
      ),
    );
    Future.delayed(Duration(seconds: 3),(){
      showLoading = false;
    });
  }
}