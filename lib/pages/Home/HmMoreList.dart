import 'package:flutter/material.dart';

class Hmmorelist extends StatefulWidget {
  Hmmorelist({Key? key}) : super(key: key);

  @override
  _HmmorelistState createState() => _HmmorelistState();
}

class _HmmorelistState extends State<Hmmorelist> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
    ), itemBuilder: (BuildContext context,int index){
      return Container(
        height: 100,
        width: 80,
        alignment: Alignment.center,
        color: Colors.blue,
        child: Text("商品$index",style: TextStyle(color: Colors.white,fontSize: 20),),
        margin: EdgeInsets.symmetric(horizontal: 10),
      );
    });
  }
}