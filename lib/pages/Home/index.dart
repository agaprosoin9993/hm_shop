import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Home/HmCategory.dart';
import 'package:hm_shop/pages/Home/HmMoreList.dart';
import 'package:hm_shop/pages/Home/HmSlider.dart';
import 'package:hm_shop/pages/Home/HmSuggestion.dart';
import 'package:hm_shop/pages/Home/HmHot.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}
class _HomeViewState extends State<HomeView> {
  List<Widget> _getScrollChildren(){
    return [
      SliverToBoxAdapter(
        child: Hmslider(),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10,),),
      SliverToBoxAdapter(
        child: Hmcategory()
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10,),),
      SliverToBoxAdapter(child: Hmsuggestion()),
      SliverToBoxAdapter(child: SizedBox(height: 10,),),
      SliverToBoxAdapter(
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
        child: Flex(
          direction: Axis.horizontal,
          children:[
            Expanded(
              child: Hmhot(),
            ),
            SizedBox(width: 10,),
            Expanded(
              child: Hmhot(),
            ),
          ]
        )
        )
        ),
        SliverToBoxAdapter(child: SizedBox(height: 10,),),
        Hmmorelist(),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChildren(),);
  }
}