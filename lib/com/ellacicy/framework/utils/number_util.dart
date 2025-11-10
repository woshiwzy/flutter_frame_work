class NumberUtil{



  ///把数字转换为字符串，如果是小数，保留一位有效数字，如果小数位全是0，转换成整数
  static String keep1OrInt(num value) {
    // 判断是否为整数
    if (value % 1 == 0) {
      return value.toInt().toString();
    } else {
      // 保留一位小数
      String result = value.toStringAsFixed(1);
      // 如果是 .0 结尾，去掉
      if (result.endsWith('.0')) {
        return result.substring(0, result.length - 2);
      }
      return result;
    }
  }
}