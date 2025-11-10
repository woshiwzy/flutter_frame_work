import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class sb {

  static SizedBox z(){
    return const SizedBox(width: 0,height: 0,);
  }

  static SizedBox w(double width){
    return SizedBox(width: width,height: 0,);
  }

  static SizedBox h(double height){
    return SizedBox(width: 0,height: height,);
  }

  static SizedBox wh(double width,double height){
    return SizedBox(width: width,height: height,);
  }
}