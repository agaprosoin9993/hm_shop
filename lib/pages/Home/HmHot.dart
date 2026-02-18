import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class Hmhot extends StatefulWidget {
  SpecialRecommendationResult? inVogueResult;
  SpecialRecommendationResult? oneStopResult;
  final String type;
  Hmhot({Key? key,this.inVogueResult,this.oneStopResult, required this.type}) : super(key: key);

  @override
  _HmhotState createState() => _HmhotState();
}

class _HmhotState extends State<Hmhot> {
  Widget _getTitle(){
    return Row(
      children: [
        Text(widget.type == "inVogue"?"爆款推荐":"一站式推荐",style: TextStyle(color: const Color.fromARGB(255, 129, 31, 31),fontSize: 18),),
        SizedBox(width: 5,),
        Text(widget.type=="inVogue"?"最受欢迎":"精心优选",style: TextStyle(color: const Color.fromARGB(255, 116, 48, 48),fontSize: 12),),
      ],
    );
  }
  List<SpecialRecommendationItem> _getItemList(){
    return widget.type == "inVogue"
      ? widget.inVogueResult?.subTypes.first.goodsItems.items.take(2).toList() ?? []
      : widget.oneStopResult?.subTypes.first.goodsItems.items.take(2).toList() ?? [];
  }
  List<Widget> _displayItem(){
    final list=_getItemList();
    return List.generate(list.length, (int index){
      return Expanded(
        child: Column(
          children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(list[index].picture,fit: BoxFit.cover,),
                  ),
                SizedBox(height: 5,),
            Text("${list[index].price}元",style: TextStyle(color: Colors.red,fontSize: 15),)
          ],
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.type == "inVogue"
          ? const Color.fromARGB(255, 153, 192, 223)
          : const Color.fromARGB(255, 223, 153, 153),
       ),
       alignment: Alignment.centerLeft,
       padding: EdgeInsets.all(10),
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getTitle(),
          SizedBox(height: 10,),
          Row(
            children: [..._displayItem()],
          )
        ],  
       )
    );
  }
}