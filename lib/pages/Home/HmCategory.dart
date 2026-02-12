import 'package:flutter/material.dart';

class Hmcategory extends StatefulWidget {
  Hmcategory({Key? key}) : super(key: key);

  @override
  _HmcategoryState createState() => _HmcategoryState();
}

class _HmcategoryState extends State<Hmcategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context,int index){
        return Container(
          height: 100,
          width: 80,
          alignment: Alignment.center,
          color: Colors.blue,
          child: Text("分类$index",style: TextStyle(color: Colors.white,fontSize: 20),),
          margin: EdgeInsets.symmetric(horizontal: 10),
        );
      })
    );
  }
}