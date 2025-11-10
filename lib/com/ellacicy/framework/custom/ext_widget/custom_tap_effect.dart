
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'double_util.dart';

class CustomTapEffect extends SingleChildRenderObjectWidget {
  ///true:与控件大小的圆背景和波纹
  final bool? borderless;
  final double? borderlessSize;

  ///true:只有在轮廓内的波纹效果
  final bool? rippleInShape;
  bool? isPressOpacity = true;//按下的时候显示半透明效果
  bool hasRoundBg = true;

  CustomTapEffect({Key? key, Widget? child, this.isPressOpacity, this.rippleInShape, this.borderless, this.borderlessSize, this.hasRoundBg = true})
      : super(key: key, child: child);

  @override
  CustomRippleRender createRenderObject(BuildContext context) =>
      CustomRippleRender(Material.of(context)!, isPressOpacity ?? false, borderless ?? false, borderlessSize, rippleInShape ?? false, hasRoundBg);

  @override
  void updateRenderObject(BuildContext context, covariant RenderObject renderObject) {
    if (renderObject is CustomRippleRender) {
      CustomRippleRender ro = renderObject;
      ro.rippleInShape = rippleInShape ?? false;
      ro.borderless = borderless ?? false;
      ro.isPressOpacity = isPressOpacity ?? false;
      ro.borderlessSize = borderlessSize;
    }
    super.updateRenderObject(context, renderObject);
  }
}

class CustomRippleRender extends RenderConstrainedBox {
  bool rippleInShape;
  bool borderless;
  bool isPressOpacity;
  double? borderlessSize;
  double circleRadius = 0;
  late AnimationController _radiusController;
  late Animation<double> _radius;
  final Tween<double> _tween = Tween(begin: 0);
  Animation<double>? _centerX;
  final Tween<double> _centerTweenX = Tween();

  Animation<double>? _centerY;
  final Tween<double> _centerTweenY = Tween();
  Offset? point;

  bool hasRoundBg = true;

  late final LayerHandle<OpacityLayer> _borderInShapeOrOpacityLayer = LayerHandle<OpacityLayer>();

  final Paint _paint = Paint()..color = const Color(0xff000000).withOpacity(0.1);

  CustomRippleRender(MaterialInkController controller, this.isPressOpacity, this.borderless, this.borderlessSize, this.rippleInShape, this.hasRoundBg)
      : super(additionalConstraints: BoxConstraints.loose(const Size(double.infinity, double.infinity))) {
    _radiusController = AnimationController(vsync: controller.vsync)
      ..addListener(() {
        markNeedsPaint();
      });
    _radius = _radiusController.drive(_tween);
    if (borderless) {
      _centerX = _radiusController.drive(_centerTweenX);
      _centerY = _radiusController.drive(_centerTweenY);
    }
  }

  @override
  bool hitTestSelf(Offset position) => true;
  bool hasRippleChild = false;

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    bool r = super.hitTestChildren(result, position: position);
    hasRippleChild = result.path.any((e) => e.target is CustomRippleRender);
    return r;
  }

  @override
  void handleEvent(PointerEvent event, BoxHitTestEntry entry) {
    if (hasRippleChild) {
      return;
    }
    if (event is PointerDownEvent) {
      point = event.localPosition;
      circleRadius = borderless ? (borderlessSize ?? (size.width.max(size.height) / 2)) : size.width + size.height;
      _tween.end = circleRadius;
      _radiusController.duration = Duration(milliseconds: (circleRadius / 0.2).floor());
      if (borderless) {
        double centerX = size.width / 2;
        double centerY = size.height / 2;
        double dx = point!.dx - centerX;
        double dy = point!.dy - centerY;
        double clickDist = Offset(dx, dy).distance;
        _centerTweenX.begin = circleRadius > clickDist ? point!.dx : (centerX + circleRadius / clickDist * dx);
        _centerTweenY.begin = circleRadius > clickDist ? point!.dy : (centerY + circleRadius / clickDist * dy);
        _centerTweenX.end = size.width / 2;
        _centerTweenY.end = size.height / 2;
      }
      _radiusController.reset();
      _radiusController.forward();
    } else if (event is PointerMoveEvent) {
      if (point != null) {
        double maxSize = 30;
        double dx = (point!.dx - event.localPosition.dx).abs();
        double dy = (point!.dy - event.localPosition.dy).abs();
        if (dx > maxSize || dy > maxSize) {
          endRipple();
        }
      }
    } else if (event is PointerUpEvent || event is PointerCancelEvent) {
      endRipple();
    }
  }

  endRipple() {
    point = null;
    if (_radiusController.isAnimating) {
      _radiusController.stop();
    }
    markNeedsPaint();
  }

  @override
  bool get alwaysNeedsCompositing => child != null && point != null && (isPressOpacity || !borderless);

  @override
  void paint(PaintingContext context, Offset offset) {
    int maxSize = 30; //确定是否绘制半透明圆角矩形（小于这个宽度，不会绘制圆角矩形 ）

    Canvas canvas = context.canvas;
    if (point != null) {
      ///点击point不为空，绘制内容和点击效果
      Rect area = Rect.fromLTWH(offset.dx, offset.dy, size.width, size.height);

      if (hasRoundBg) {
        super.paint(context, offset);
        canvas = context.canvas;
        canvas.drawRect(area, _paint);
      } else {
        _paintWithNewLayer(context, offset, area, (ctx, ofs) => ctx.paintChild(child!, ofs));
      }

/*      if (isIOSEffect) {
        ///IOS效果
        bool isLarge = size.width.max(size.height) > maxSize;

        if (isLarge) {
          ///IOS大尺寸控件需要绘制灰色背景
          super.paint(context, offset);
          canvas = context.canvas;
          canvas.drawRect(area, _paint);
        } else {
          ///IOS小尺寸控件半透明即可
          _paintWithNewLayer(context, offset, area, (ctx, ofs) => ctx.paintChild(child!, ofs));
        }
      } else {
        ///IOS效果
        bool isLarge = size.width.max(size.height) > maxSize;

        ///IOS大尺寸控件需要绘制灰色背景
        super.paint(context, offset);
        canvas = context.canvas;
        canvas.drawRect(area, _paint);

        ///======================
      }*/
    } else {
      ///没有点击，绘制内容
      super.paint(context, offset);
      _borderInShapeOrOpacityLayer.layer = null;
    }
  }

  void _paintWithNewLayer(PaintingContext context, Offset offset, Rect rect, Function(PaintingContext context, Offset offset) paintChild) {
    _borderInShapeOrOpacityLayer.layer = _borderInShapeOrOpacityLayer.layer ?? OpacityLayer()
      ..alpha = isPressOpacity ? 125 : 255;

    context.pushLayer(
      _borderInShapeOrOpacityLayer.layer!,
      paintChild, // 子节点绘制回调；添加完layer后，子节点会在新的layer上绘制
      offset,
      childPaintBounds: rect,
    );
  }

  @override
  void dispose() {
    point = null;
    _radiusController.dispose();
    _borderInShapeOrOpacityLayer.layer = null;
    super.dispose();
  }
}
