

import 'dart:math';
import 'dart:ui';

class GeometryUtil{


  ///计算两点之间的距离
 static double calculateDistance(double x1, double y1, double x2, double y2) {
    return sqrt(pow(x2 - x1, 2) + pow(y2 - y1, 2));
  }


  ///计算标记点渲染后到真实的点距离
 static Offset percent2Offset(dynamic ox, Rect rect) {
    double x = rect.size.width * (ox["xp"] as double);
    double y = rect.size.height * (ox["yp"] as double);
    return Offset(x, y);
  }

  ///判断点是否在矩形内部
 static bool isPointInRectangle(double px, double py, Rect rect) {
    double x1 = rect.left;
    double y1 = rect.top;
    double x2 = x1 + rect.width;
    double y2 = y1 + rect.height;
    // 先确保矩形的坐标是正确的，x1, y1 为左上角，x2, y2 为右下角
    double minX = x1 < x2 ? x1 : x2;
    double maxX = x1 > x2 ? x1 : x2;
    double minY = y1 < y2 ? y1 : y2;
    double maxY = y1 > y2 ? y1 : y2;
    // 判断点是否在矩形内
    return px >= minX && px <= maxX && py >= minY && py <= maxY;
  }

  /// 计算2个矩形的外接矩形，用于计算圆点摸tip的位置
 static Rect getBoundingBox(Rect rect1, Rect rect2) {
    // 计算外接矩形的边界
    double minX = rect1.left < rect2.left ? rect1.left : rect2.left;
    double minY = rect1.top < rect2.top ? rect1.top : rect2.top;

    double maxX = rect1.right > rect2.right ? rect1.right : rect2.right;
    double maxY = rect1.bottom > rect2.bottom ? rect1.bottom : rect2.bottom;
    // 返回外接矩形
    return Rect.fromLTRB(minX, minY, maxX, maxY);
  }



 ///判断是否点中图片的指定区域
 ///sw,sh,图片的原始大小
 ///renderSize:图片的渲染后所占用的像素大小
 ///clicLtInSImg:原图上可以点击的区域左上角
 /// clickW, clickH:原图上可点击的矩形的宽度和高度
 /// localPosition：实际交互的时候点击的内容
 static isClickImgArea(int sw, int sh, Size renderSize, Offset clicLtInSImg, int clickW, int clickH, Offset localPosition) {
   //debugPrint("图片大小:${renderSize}");
   //debugPrint("点击区域:${localPosition}");
   double minX = clicLtInSImg.dx / sw * renderSize.width; //按比例求出渲染后的做上角X
   double maxX = minX + clickW / sw * renderSize.width; //
   double minY = clicLtInSImg.dy / sh * renderSize.height;
   double maxY = minY + renderSize.height * clickH / sh;
   Rect r = Rect.fromLTRB(minX, minY, maxX, maxY);
   // debugPrint("矩形区域--->:${r}");
   if (r.contains(localPosition)) {
     return true;
   }
   return false;
 }

}