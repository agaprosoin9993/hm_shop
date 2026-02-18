import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class Hmsuggestion extends StatefulWidget {
  final SpecialRecommendationResult? specialRecommendationResult;
  Hmsuggestion({Key? key,this.specialRecommendationResult}) : super(key: key);

  @override
  _HmsuggestionState createState() => _HmsuggestionState();
}

class _HmsuggestionState extends State<Hmsuggestion> {
  Widget _buildTitle(){
    return Container(
      child: Row(
        children: [
          Text("特惠推荐",style: TextStyle(color: const Color.fromARGB(255, 151, 39, 39),fontSize: 20),),
          SizedBox(width: 10,),
          Text("精选省攻略",style: TextStyle(color: const Color.fromARGB(255, 140, 72, 72),fontSize: 15),),
        ],
      ),
    );
  }
  Widget _buildLeft(){
    return Container(
      width: 100,
      height: 150,
      child:ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset("lib/assets/home_cmd_inner.png",fit: BoxFit.cover,),
    ),
    );
  }
  List<SpecialRecommendationItem> _getSpecialRecommendationList(){
    return widget.specialRecommendationResult?.subTypes.first.goodsItems.items.take(3).toList() ?? [];
  }
  List<Widget> _buildRight(){
    final list = _getSpecialRecommendationList();
    return List.generate(list.length, (int index){
      return Column(
        children:[
          Image.network(list[index].picture,width: 80,height: 80,fit: BoxFit.cover,errorBuilder: (context,error,stackTrace){
            return Image.asset("lib/assets/home_cmd_inner.png",width: 80,height: 80,fit: BoxFit.cover,);
          }),
          SizedBox(height: 5,),
          Text("${list[index].price}元",style: TextStyle(color: Colors.red,fontSize: 15),)
        ],
      );

    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
       margin: EdgeInsets.symmetric(horizontal: 10),
       padding: EdgeInsets.all(10),
       decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage("lib/assets/home_cmd_sm.png"),
          fit: BoxFit.cover,
        ),
       ),
       child: Column(
        children: [
          _buildTitle(),
          SizedBox(height: 10,),
          Row(
            children:[
              _buildLeft(),
              SizedBox(width: 10,),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [..._buildRight()],
                ),
              )
            ]
          )
        ],
       ),
    );
  }
}