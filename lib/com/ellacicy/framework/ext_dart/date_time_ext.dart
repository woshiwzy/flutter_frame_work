import 'dart:ui';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

extension Last on DateTime {


  /// 把过去一天的时间当成负数，方便显示到坐标轴
  int shaftHour(int hour){
    int shaf=hour;
    if(hour>=0){
      shaf=hour;
    }else{
      shaf=-(12-hour.abs());
    }
    return shaf;
  }



  String getWeekEnStr() {
    String label = "";
    switch (weekday) {
      case 1:
        {
          label = "Sun";
        }
        break;
      case 2:
        {
          label = "Mon";
        }
        break;
      case 3:
        {
          label = "Tue";
        }
        break;
      case 4:
        {
          label = "Wed";
        }
        break;
      case 5:
        {
          label = "Thu";
        }
        break;
      case 6:
        {
          label = "Fri";
        }
        break;
      case 7:
        {
          label = "Sat";
        }
        break;
    }

    return label;
  }

  static DateTime parseYYYYMMDDDate(String dateString) {
    int year = int.parse(dateString.substring(0, 4));
    int month = int.parse(dateString.substring(4, 6));
    int day = int.parse(dateString.substring(6, 8));

    return DateTime(year, month, day);
  }

  List<String> lastYear() {
    var dateFormat = DateFormat('yyyy-MM-dd');
    DateTime now = DateTime.now();
    String weekStart = dateFormat.format(now);
    var weekEnd = dateFormat.format(now.subtract(const Duration(days: 364)));
    return [weekStart, weekEnd];
  }

  List<String> lastMonth() {
    var dateFormat = DateFormat('yyyy-MM-dd');
    DateTime now = DateTime.now();
    String weekStart = dateFormat.format(now);
    var weekEnd = dateFormat.format(now.subtract(const Duration(days: 29)));
    return [weekStart, weekEnd];
  }

  ///转换时间为10进制:9:30->9.5h 方便显示在轴上
  double toTenRaxHour(){
    double minute=double.parse((this.minute/60).toStringAsFixed(1));
    double tenRaxDouble=hour+minute;
    return tenRaxDouble;
  }

   List<String> lastWeek() {
    var dateFormat = DateFormat('yyyy-MM-dd');
    DateTime now = DateTime.now();
    String weekStart = dateFormat.format(now);
    String weekEnd = dateFormat.format(now.subtract(const Duration(days: 6)));
    return [weekStart, weekEnd];
  }
}
