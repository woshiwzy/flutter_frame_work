import 'dart:math';
import 'dart:ui';

extension OffsetExt on Offset {

  distanceTo(Offset offsetTo) {
    double deltaX = offsetTo.dx - this.dx;
    double deltaY = offsetTo.dy - this.dy;
    double distance = sqrt(deltaX * deltaX + deltaY * deltaY);
    return distance;
  }

}
