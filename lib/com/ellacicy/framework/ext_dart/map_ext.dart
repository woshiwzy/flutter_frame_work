
import 'dart:collection';

import 'package:flutter/cupertino.dart';
extension MapExt on Map<String,dynamic> {

 String nn(String key,{String placeHolder=""}){
    if(containsKey(key) && null!=this[key]){
      return this[key].toString();
    }
    return placeHolder;
  }

  Map<String,dynamic> no(String key){

   if(containsKey(key) && null!=this[key]){
     return this[key];
   }else{
     return <String,dynamic>{};
   }

  }

}


extension MapExt2 on Map<dynamic,dynamic> {

  String nn2(String key,{String placeHolder=""}){
    if(containsKey(key) && null!=this[key]){
      return this[key].toString();
    }
    return placeHolder;
  }
}


extension MapExt3 on Map<String,dynamic> {

  String nn3(String key,{String placeHolder=""}){
    if(containsKey(key) && null!=this[key]){
      return this[key].toString();
    }
    return placeHolder;
  }

  String nn4(String key,{String placeHolder=""}){
    if(containsKey(key) && null!=this[key]){
      return this[key].toString();
    }
    return placeHolder;
  }

  ///获取下一级的某个object的数据
  String deep1KeyValue(String key,String key2,{String placeHolder=""}){
    if(containsKey(key) && null!=this[key]){
      Map<String,dynamic> keyObj1=this[key];
      if(null==keyObj1){
        return placeHolder;
      }else{
        return keyObj1. nn4(key2,placeHolder: placeHolder);
      }
    }
    return placeHolder;
  }

}


extension MapExt4 on Map {



  Map<String,Object> cloneMe(){
    var nmap=<String,Object>{};
    for (var k in keys) {
      nmap[k]=this[k];
    }
    return nmap;
  }

  Map<String,dynamic> cloneMeDynamic(){
    var nmap=<String,dynamic>{};
    for (var k in keys) {
      nmap[k]=this[k];
    }
    return nmap;
  }


  Map<K, V> deepCloneMap<K, V>(Map<K, V> original) {
    Map<K, V> clonedMap = {};

    for (var entry in original.entries) {
      var key = entry.key;
      var value = entry.value;

      if (value is Map) {
        // 如果值是一个 Map，递归深度克隆
        clonedMap[key] = deepCloneMap(value as Map) as V;
      } else if (value is List) {
        // 如果值是一个 List，递归深度克隆
        clonedMap[key] = deepCloneList(value as List) as V;
      } else {
        // 如果是普通值，直接赋值
        clonedMap[key] = value;
      }
    }

    return clonedMap;
  }

  List deepCloneList(List original) {
    List clonedList = [];

    for (var item in original) {
      if (item is Map) {
        // 如果项是一个 Map，递归深度克隆
        clonedList.add(deepCloneMap(item));
      } else if (item is List) {
        // 如果项是一个 List，递归深度克隆
        clonedList.add(deepCloneList(item));
      } else {
        // 如果是普通值，直接添加
        clonedList.add(item);
      }
    }

    return clonedList;
  }


}


// extension MapExt3<K,V> on Map<K,V> {
//
//   String nn(String key){
//     if(containsKey(key) && null!=this[key]){
//       return this[key].toString();
//     }
//     return "";
//   }
// }


extension PrettyPrint<K, V> on HashMap<K, V> {
  // 添加一个打印每个键值对的方法
  void printPretty() {
    forEach((key, value) {
      debugPrint('$key: $value');
    });
  }
}