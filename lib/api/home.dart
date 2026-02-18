//封装轮播图接口
import 'package:hm_shop/constants/index.dart';
import 'package:hm_shop/utils/DioRequest.dart';
import 'package:hm_shop/viewmodels/home.dart';

Future<List<BannerItem>> getBannerListAPI() async{
 final tt = ((await dioRequest.get(HttpConstants.BANNER_LIST)) as List).map((item){
    return BannerItem.fromJson(item as Map<String, dynamic>);
  }).toList();
  return tt;
}
//封装分类列表接口
Future<List<CategoryItem>> getCategoryListAPI() async{
  final tt = ((await dioRequest.get(HttpConstants.CATEGORY_LIST)) as List).map((item){
    return CategoryItem.fromJson(item as Map<String, dynamic>);
  }).toList();
  return tt;
}
//封装特惠推荐接口
Future<SpecialRecommendationResult> getSpecialRecommendationAPI() async{
  final response = await dioRequest.get(HttpConstants.PRODUCT_LIST);
  return SpecialRecommendationResult.fromJson(response as Map<String, dynamic>);
}
//封装热门推荐接口
Future<SpecialRecommendationResult> getInVogueAPI() async{
  final response = await dioRequest.get(HttpConstants.INVOGUE_LIST);
  return SpecialRecommendationResult.fromJson(response as Map<String, dynamic>);
}
//封装一站式推荐接口
Future<SpecialRecommendationResult> getOneStopAPI() async{
  final response = await dioRequest.get(HttpConstants.ONESTOP_LIST);
  return SpecialRecommendationResult.fromJson(response as Map<String, dynamic>);
}
Future<List<GoodDetailItem>> getRecommendListAPI(
  Map<String, dynamic> params,
) async {
  return ((await dioRequest.get(HttpConstants.RECOMMEND_LIST, queryParameters: params))
          as List)
      .map((item) {
        return GoodDetailItem.formJSON(item as Map<String, dynamic>);
      })
      .toList();
}