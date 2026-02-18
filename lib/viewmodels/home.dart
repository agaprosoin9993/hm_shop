
class BannerItem{
  String id;
  String imgUrl;
  BannerItem({required this.id,required this.imgUrl});
  factory BannerItem.fromJson(Map<String,dynamic> json){
    return BannerItem(id: json["id"] ?? "", imgUrl: json["imgUrl"] ?? "");
  }
}//每一个轮播图
class CategoryItem{
  String id;
  String name;
  String picture;
  List<CategoryItem>? children;
  CategoryItem({required this.id, required this.name, required this.picture, this.children});
  factory CategoryItem.fromJson(Map<String, dynamic> json){
    return CategoryItem(
      id: json["id"],
      name: json["name"],
      picture: json["picture"],
      children: json["children"] == null ? null : (json["children"] as List).map((e) => CategoryItem.fromJson(e)).toList(),
    );
  }
}

class SpecialRecommendationItem{
  String id;
  String name;
  String? desc;
  String price;
  String picture;
  int orderNum;
  SpecialRecommendationItem({required this.id, required this.name, this.desc, required this.price, required this.picture, required this.orderNum});
  factory SpecialRecommendationItem.fromJson(Map<String, dynamic> json){
    return SpecialRecommendationItem(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      desc: json["desc"],
      price: json["price"] ?? "0",
      picture: json["picture"] ?? "",
      orderNum: json["orderNum"] ?? 0,
    );
  }
}

class GoodsItems{
  int counts;
  int pageSize;
  int pages;
  int page;
  List<SpecialRecommendationItem> items;
  GoodsItems({required this.counts, required this.pageSize, required this.pages, required this.page, required this.items});
  factory GoodsItems.fromJson(Map<String, dynamic> json){
    return GoodsItems(
      counts: json["counts"] ?? 0,
      pageSize: json["pageSize"] ?? 0,
      pages: json["pages"] ?? 0,
      page: json["page"] ?? 0,
      items: (json["items"] as List).map((e) => SpecialRecommendationItem.fromJson(e)).toList(),
    );
  }
}

class SubType{
  String id;
  String title;
  GoodsItems goodsItems;
  SubType({required this.id, required this.title, required this.goodsItems});
  factory SubType.fromJson(Map<String, dynamic> json){
    return SubType(
      id: json["id"] ?? "",
      title: json["title"] ?? "",
      goodsItems: GoodsItems.fromJson(json["goodsItems"]),
    );
  }
}

class SpecialRecommendationResult{
  String id;
  String title;
  List<SubType> subTypes;
  SpecialRecommendationResult({required this.id, required this.title, required this.subTypes});
  factory SpecialRecommendationResult.fromJson(Map<String, dynamic> json){
    return SpecialRecommendationResult(
      id: json["id"] ?? "",
      title: json["title"] ?? "",
      subTypes: (json["subTypes"] as List).map((e) => SubType.fromJson(e)).toList(),
    );
  }
}

class GoodDetailItem extends SpecialRecommendationItem{
  int payCount = 0;

  /// 商品详情项
  GoodDetailItem({
    required super.id,
    required super.name,
    required super.price,
    required super.picture,
    required super.orderNum,
    required this.payCount,
  }) : super(desc: "");
  // 转化方法
  factory GoodDetailItem.formJSON(Map<String, dynamic> json) {
    return GoodDetailItem(
      id: json["id"]?.toString() ?? "",
      name: json["name"]?.toString() ?? "",
      price: json["price"]?.toString() ?? "",
      picture: json["picture"]?.toString() ?? "",
      orderNum: int.tryParse(json["orderNum"]?.toString() ?? "0") ?? 0,
      payCount: int.tryParse(json["payCount"]?.toString() ?? "0") ?? 0,
    );
  }
}