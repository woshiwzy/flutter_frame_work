import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class DateUtil {

  static DateFormat DF_DD_MMM_YYYY=DateFormat("dd MMM yyyy");
  static DateFormat DF_DD_MM_YYYY=DateFormat("dd-MM-yyyy");
  static DateFormat DF_YYYY_MM_DD=DateFormat("yyyy-MM-dd");
  static DateFormat DF_MMM_YY=DateFormat("MMM yyyy");
  static DateFormat DF_YMDHMS=DateFormat("yyyy-MM-dd HH:mm:ss");
  static DateFormat DF_YMDHM=DateFormat("yyyy-MM-dd HH:mm");

  static DateFormat DF_MDHM=DateFormat("MM-dd HH:mm");

  static DateFormat DF_HM=DateFormat("HH:mm");
  static DateFormat DF_YMD=DateFormat("yyyy-MM-dd");
  static DateFormat DF_YMD2=DateFormat("yyyy/MM/dd");

  static DateFormat DF_DD=DateFormat("dd");
  static DateFormat DF_MM=DateFormat("MM");
  static DateFormat DF_HH=DateFormat("HH");
  static DateFormat DF_YYYY_MM=DateFormat("yyyy-MM");
  static DateFormat DD_MMM_YYYY_EEEE = DateFormat('dd MMM, yyyy, EEEE');

  static DateFormat DD_MMM_YYYY_EEEE_HH_MM = DateFormat('dd MMM, yyyy, HH:mm');
  static DateFormat DD_MMM_YYYY_EEEE_HH_MM2 = DateFormat('dd MMM yyyy, HH:mm');


  static DateFormat DD_MM_YY_HH_MM_SS = DateFormat('dd/MM/yyyy HH:mm:ss');
  static DateFormat DD_MM_YY_HH_MM = DateFormat('dd/MM/yyyy HH:mm');
  static DateFormat DD_MM_YYYY = DateFormat('dd/MM/yyyy');

  static DateFormat EEE_MMM_D = DateFormat('EEEE, MMM d');
  static DateFormat MMM_D = DateFormat('MMM d');



  parseDate2Int(String dateStr) {
    DateTime date = DateTime.now();
    int intDate = 0;
    if (dateStr.length == 10) {
      DateFormat df = DateFormat("yyyy-MM-dd");
      date = df.parse(dateStr);
      DateFormat df2 = DateFormat("yyyyMMdd");
      intDate = int.parse(df2.format(date));
    } else if (dateStr.length == 7) {
      DateFormat df = DateFormat("yyyy-MM");
      DateFormat df2 = DateFormat("yyyyMM");
      date = df.parse(dateStr);
      intDate = int.parse(df2.format(date));
    } else if (dateStr.length == 18) {
      //2023-12-12 00:00:00
      DateFormat df = DateFormat("yyyy-MM-dd HH:mm:ss");
      DateFormat df2 = DateFormat("yyyyMMddHHmmss");
      date = df.parse(dateStr);
      intDate = int.parse(df2.format(date));
    }
    return intDate;
  }

  static currentWeekDays(){
    DateTime now = DateTime.now();
    // 获取今天是周几，Dart中周一是1，周日是7
    int todayWeekday = now.weekday;
    // 计算当前日期距离周一和周日的天数差
    int differenceToMonday = todayWeekday - DateTime.monday;
    var weeks=[];
    // 计算周一和周日的日期
    DateTime monday = now.subtract(Duration(days: differenceToMonday));
    for(int i=0;i<7;i++){
      DateTime d=monday.add(Duration(days: i));
      weeks.add(d);
    }
    return weeks;
  }

  static lastYear() {
    var dateFormat = DateFormat('yyyy-MM-dd');
    DateTime now = DateTime.now();
    String weekStart = dateFormat.format(now);
    var weekEnd = dateFormat.format(now.subtract(Duration(days: 364)));
    return [weekEnd, weekStart];
  }

  static lastMonth() {
    var dateFormat = DateFormat('yyyy-MM-dd');
    DateTime now = DateTime.now();
    String weekStart = dateFormat.format(now);
    var weekEnd = dateFormat.format(now.subtract(Duration(days: 29)));
    return [weekEnd, weekStart];
  }

  static lastWeek() {
    var dateFormat = DateFormat('yyyy-MM-dd');
    DateTime now = DateTime.now();
    String weekStart = dateFormat.format(now);
    var weekEnd = dateFormat.format(now.subtract(Duration(days: 6)));

    return [weekEnd, weekStart];
  }

  static last24Hour() {
    var dateFormat = DateFormat('yyyy-MM-dd');
    DateTime now = DateTime.now();
    String dayStart = dateFormat.format(now);
    var dayEnd = dayStart;
    return [dayStart, dayEnd];
  }

  static DateTime parseYYYYMMDDDate(String dateString) {
    // debugPrint("parse.debugPrint--> " + dateString);
    int year = int.parse(dateString.substring(0, 4));
    int month = int.parse(dateString.substring(4, 6));
    int day = int.parse(dateString.substring(6, 8));

    return DateTime(year, month, day);
  }

  static String getWeekCnStr(int weekday, Locale locale) {
    String label = "";
    switch (weekday) {
      case 1:
        {
          label = "一";
        }
        break;
      case 2:
        {
          label = "二";
        }
        break;
      case 3:
        {
          label = "三";
        }
        break;
      case 4:
        {
          label = "四";
        }
        break;
      case 5:
        {
          label = "五";
        }
        break;
      case 6:
        {
          label = "六";
        }
        break;
      case 7:
        {
          label = "日";
        }
        break;
    }

    return label;
  }


  static String getWeekEn3Str(int weekday) {
    String label = "";
    switch (weekday) {
      case 1:
        {
          label = "Mon";
        }
        break;
      case 2:
        {
          label = "Tue";
        }
        break;
      case 3:
        {
          label = "Wed";
        }
        break;
      case 4:
        {
          label = "Thu";
        }
        break;
      case 5:
        {
          label = "Fri";
        }
        break;
      case 6:
        {
          label = "Sat";
        }
        break;
      case 7:
        {
          label = "Sun";
        }
        break;
    }

    return label;
  }

}
