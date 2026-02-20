import 'package:flutter/material.dart';
import 'package:hm_shop/api/home.dart';
import 'package:hm_shop/pages/Home/HmCategory.dart';
import 'package:hm_shop/pages/Home/HmMoreList.dart';
import 'package:hm_shop/pages/Home/HmSlider.dart';
import 'package:hm_shop/pages/Home/HmSuggestion.dart';
import 'package:hm_shop/pages/Home/HmHot.dart';
import 'package:hm_shop/utils/ToastUtils.dart';
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
    _registerEvent();
    Future.microtask((){
      _paddingTop = 400;
      setState(() {
      });
      _key.currentState?.show();
    });
  }
  Future<void> _getBannerList() async{
    final list = await getBannerListAPI();
      _bannerList = list;
  }//获取轮播图列表
  Future<void> _getCategoryList() async{
    final list = await getCategoryListAPI();
      _categoryList = list;
  }//获取分类列表
  Future<void> _getSpecialRecommendationList() async{
    final result = await getSpecialRecommendationAPI();
      _specialRecommendationResult = result;
  }//获取特惠推荐列表
  Future<void> _getInVogueList() async{
    final result = await getInVogueAPI();
      _inVogueResult = result;
  }//获取热门推荐列表
  Future<void> _getOneStopList() async{
    final result = await getOneStopAPI();
      _oneStopResult = result;
  }//获取一站式推荐列表
  int _page = 1;
  bool _isLoading = false;
  bool _isHasMore = true;
  Future<void> _getRecommendList() async {
    if(_isLoading || !_isHasMore) return;
    int requestLimit = _page * 8;
    _isLoading = true;
    final list = await getRecommendListAPI({"limit": requestLimit});
    _isLoading = false;
    if(list.length < requestLimit){
      _isHasMore = false;
    }
      _recommendList.addAll(list);
    _page++;
  }//获取商品详情列表
   void _registerEvent(){
      _controller.addListener(() {
        if(_controller.position.pixels >= _controller.position.maxScrollExtent-50){
          _getRecommendList();
        }//判断是否到底部
      });
    }
 Future<void> onRefresh() async{
    _page = 1;
    _isLoading = false;
    _isHasMore = true;
    await _getRecommendList();
    await _getBannerList();
    await _getCategoryList();
    await _getSpecialRecommendationList();
    await _getInVogueList();
    await _getOneStopList();
    ToastUtils.showTost(context, "刷新成功");
      _paddingTop = 0;
      setState(() {
      });
  }
  List<Widget> _getScrollChildren(){
    List<Widget> children = [
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
    return children;
  }
  GlobalKey<RefreshIndicatorState> _key = GlobalKey<RefreshIndicatorState>();
  double _paddingTop = 300;
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _key,
      onRefresh: onRefresh,
      child: AnimatedContainer(
        padding: EdgeInsets.only(top: _paddingTop),
        duration: Duration(milliseconds: 500),
        child: CustomScrollView(
          controller: _controller,
          slivers: _getScrollChildren(),
        ),
      ),
    );
  }
}