import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class Hmslider extends StatefulWidget {
  final List<BannerItem> bannerList;
  Hmslider({Key? key, required this.bannerList}) : super(key: key);

  @override
  _HmsliderState createState() => _HmsliderState();
}

class _HmsliderState extends State<Hmslider> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: widget.bannerList.map((i) => Container(
        height: 300,
        alignment: Alignment.center,
        child: Image.network(i.imgUrl, fit: BoxFit.cover, width: double.infinity),
      )).toList(),
      options: CarouselOptions(
        height: 300,
        autoPlay: true,
        aspectRatio: 16/9,
        autoPlayInterval: Duration(seconds: 2),
        viewportFraction: 1,
      ),
    );
  }
}