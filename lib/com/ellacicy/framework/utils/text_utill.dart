

class MyTextUtils{


  static String format2String(String input) {
    return input.length < 2 ? input.padLeft(2, ' ') : input;
  }

  static String truncateWithEllipsis(int cutoff, String myString) {
    return (myString.length <= cutoff)
        ? myString
        : '${myString.substring(0, cutoff)}...';
  }

  static String formatSeconds(int seconds) {
    final int min = seconds ~/ 60;
    final int sec = seconds % 60;
    // 使用padLeft来确保两位数都有前导零
    final String minStr = min.toString().padLeft(2, '0');
    final String secStr = sec.toString().padLeft(2, '0');
    return "$minStr:$secStr";
  }


  static String convertToString(num value, {int decimalPlaces = 2}) {
    if (value == value.toInt()) {
      return value.toInt().toString();
    } else {
      return value.toStringAsFixed(decimalPlaces);  // 保留指定的小数位数
    }
  }

  // 1.0 -> 1,1.11->1.1
 static String formatNumber(String number) {
    // 尝试将输入字符串解析为数字
    double? parsedNumber = double.tryParse(number);
    if (parsedNumber == null) {
      return number;
    }
    // 检查是否是整数
    if (parsedNumber % 1 == 0) {
      // 如果是整数，返回整数部分的字符串
      return parsedNumber.toInt().toString();
    } else {
      // 如果是小数，保留一位小数
      return parsedNumber.toStringAsFixed(1);
    }
  }


}