import 'package:flutter/material.dart';
import 'package:hm_shop/api/home.dart';
import 'package:hm_shop/pages/Home/HmCategory.dart';
import 'package:hm_shop/pages/Home/HmMoreList.dart';
import 'package:hm_shop/pages/Home/HmSlider.dart';
import 'package:hm_shop/pages/Home/HmSuggestion.dart';
import 'package:hm_shop/pages/Home/HmHot.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}
class _HomeViewState extends State<HomeView> {
  List<BannerItem> _bannerList = [];
  List<CategoryItem> _categoryList = [];
  SpecialRecommendationResult? _specialRecommendationResult;
  SpecialRecommendationResult? _inVogueResult;
  SpecialRecommendationResult? _oneStopResult;
  List<GoodDetailItem> _recommendList = [];
  @override
  void initState() {
    super.initState();
    _getBannerList();
    _getCategoryList();
    _getSpecialRecommendationList();
    _getInVogueList();
    _getOneStopList();
    _getRecommendList();
  }
  void _getBannerList() async{
    final list = await getBannerListAPI();
    setState(() {
      _bannerList = list;
    });
  }//获取轮播图列表
  void _getCategoryList() async{
    final list = await getCategoryListAPI();
    setState(() {
      _categoryList = list;
    });
  }//获取分类列表
  void _getSpecialRecommendationList() async{
    final result = await getSpecialRecommendationAPI();
    setState(() {
      _specialRecommendationResult = result;
    });
  }//获取特惠推荐列表
  void _getInVogueList() async{
    final result = await getInVogueAPI();
    setState(() {
      _inVogueResult = result;
    });
  }//获取热门推荐列表
  void _getOneStopList() async{
    final result = await getOneStopAPI();
    setState(() {
      _oneStopResult = result;
    });
  }//获取一站式推荐列表
  void _getRecommendList() async {
    final list = await getRecommendListAPI({"limit": 10});
    setState(() {
      _recommendList = list;
    });
  }//获取商品详情列表
  List<Widget> _getScrollChildren(){
    return [
      SliverToBoxAdapter(
        child: Hmslider(bannerList: _bannerList),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10,),),
      SliverToBoxAdapter(
        child: Hmcategory(categoryList: _categoryList),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10,),),
      SliverToBoxAdapter(child: Hmsuggestion(specialRecommendationResult: _specialRecommendationResult)),
      SliverToBoxAdapter(child: SizedBox(height: 10,),),
      SliverToBoxAdapter(
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
        child: Flex(
          direction: Axis.horizontal,
          children:[
            Expanded(
              child: Hmhot(inVogueResult: _inVogueResult,type: "inVogue",),
            ),
            SizedBox(width: 10,),
            Expanded(
              child: Hmhot(oneStopResult: _oneStopResult,type: "oneStop",),
            ),
          ]
        )
        )
        ),
        SliverToBoxAdapter(child: SizedBox(height: 10,),),
        HmMoreList(recommendList: _recommendList,),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChildren(),);
  }
}