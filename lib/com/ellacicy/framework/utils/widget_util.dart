import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyWidgetUtil{



  static   Widget createRateStar(int totalStar,int currentStar,{double size=10,Color checkColor=const Color(0xff607AE3),Color unCheckColor=const Color(0xffe3e3e3)}){

    List<Widget> stars=[];

    for(int i=0;i<totalStar;i++){
      Color? c=i<currentStar?checkColor:unCheckColor;
      stars.add(Icon(Icons.star,size: size,color: c,));
    }

    return Row(
      children: stars,
    );
  }
}