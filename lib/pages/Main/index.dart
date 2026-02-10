import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Cart/index.dart';
import 'package:hm_shop/pages/Category/index.dart';
import 'package:hm_shop/pages/Home/index.dart';
import 'package:hm_shop/pages/Mine/index.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}
int _currentIndex=0;
class _MainPageState extends State<MainPage> {
  final List<Map<String, String>> _tabList=[{
    "icon":"lib/assets/mainIcon.png",
    "activeIcon":"lib/assets/activeIcon.png",
    "text":"首页"},
    {
    "icon":"lib/assets/mainIcon.png",
    "activeIcon":"lib/assets/activeIcon.png",
    "text":"分类"},
    {
    "icon":"lib/assets/mainIcon.png",
    "activeIcon":"lib/assets/activeIcon.png",
    "text":"购物车"},
    {
    "icon":"lib/assets/mainIcon.png",
    "activeIcon":"lib/assets/activeIcon.png",
    "text":"我的"},
    ];
List<BottomNavigationBarItem> _getTabBarWidget(){
  return List.generate(_tabList.length, (index){
    return BottomNavigationBarItem(
      icon:Image.asset(_tabList[index]["icon"]!, width:30, height:30),
      activeIcon:Image.asset(_tabList[index]["activeIcon"]!, width:30, height:30),
      label:_tabList[index]["text"]!,
    );
  });
}
List<Widget> _getViewWidget(){
  return [HomeView(),CategoryView(),CartView(),MineView()];
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: _getViewWidget(),
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        onTap:(int index){
          setState(() {
            _currentIndex=index;
          });
        },
        currentIndex:_currentIndex,
        items: _getTabBarWidget(),
      ),
    );
  }
}