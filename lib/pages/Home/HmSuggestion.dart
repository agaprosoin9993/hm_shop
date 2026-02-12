import 'package:flutter/material.dart';

class Hmsuggestion extends StatefulWidget {
  Hmsuggestion({Key? key}) : super(key: key);

  @override
  _HmsuggestionState createState() => _HmsuggestionState();
}

class _HmsuggestionState extends State<Hmsuggestion> {
  @override
  Widget build(BuildContext context) {
    return Container(
       height: 250,
       decoration: BoxDecoration(color: Colors.blue,),
       child: Text("搜索建议",style: TextStyle(color: Colors.white,fontSize: 30),),
       alignment: Alignment.center,
       margin: EdgeInsets.symmetric(horizontal: 10),
    );
  }
}