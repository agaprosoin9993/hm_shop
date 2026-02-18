import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class Hmcategory extends StatefulWidget {
  final List<CategoryItem> categoryList;
  Hmcategory({Key? key,required this.categoryList}) : super(key: key);

  @override
  _HmcategoryState createState() => _HmcategoryState();
}

class _HmcategoryState extends State<Hmcategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        itemCount: widget.categoryList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context,int index){
        final categoryItem = widget.categoryList[index];
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(categoryItem.picture,height: 40,),
              Text(categoryItem.name,style: TextStyle(color: Colors.black,fontSize: 16),),
            ],
          ),
          width: 80,
          alignment: Alignment.center,
        );
      })
    );
  }
}