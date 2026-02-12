import 'package:flutter/material.dart';

class Hmslider extends StatefulWidget {
  Hmslider({Key? key}) : super(key: key);

  @override
  _HmsliderState createState() => _HmsliderState();
}

class _HmsliderState extends State<Hmslider> {
  @override
  Widget build(BuildContext context) {
    return Container(
       height: 300,
       decoration: BoxDecoration(color: Colors.blue,),
       child: Text("轮播图",style: TextStyle(color: Colors.white,fontSize: 20),),
       alignment: Alignment.center,
    );
  }
}