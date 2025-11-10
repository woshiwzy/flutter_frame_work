import 'dart:ui';

extension LocalExt on Locale {


  bool isChinese(){
    return languageCode == "zh_CN";
  }

}