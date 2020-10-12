library curved_bottom_navigation;

import 'dart:math' as math;

import 'package:flutter/material.dart';

class CurvedBottomNavigation extends ImplicitlyAnimatedWidget {
  final List<Widget> items;
  final double fabSize;
  final double navHeight;
  final double fabMargin;
  final double iconSize;
  final int selected;
  final Color bgColor;
  final fabBgColor;
  final Function(int) onItemClick;

  const CurvedBottomNavigation({
    Key key,
    @required this.items,
    this.fabSize = 62,
    this.navHeight = 68,
    this.fabMargin = 8,
    this.iconSize = 24,
    this.selected = 0,
    this.bgColor = Colors.black,
    this.fabBgColor = Colors.black,
    this.onItemClick,
  }) : super(key: key, duration: const Duration(milliseconds: 300));

  @override
  _MyBottomNavigationState createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends AnimatedWidgetBaseState<CurvedBottomNavigation> {
  List<Tween<double>> _itemsTranslationY;
  Tween<double> _selectedPercentTween;

  @override
  void initState() {
    _itemsTranslationY = List.generate(widget.items.length, (index) => null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double additionalBottomPadding = math.max(MediaQuery.of(context).padding.bottom, 0.0);

    return SizedBox(
      width: double.infinity,
      height: widget.navHeight + (widget.fabSize / 2) + additionalBottomPadding,
      child: Stack(
        children: [
          CustomPaint(
            painter: _MyBottomNavigationCustomPainter(
              _selectedPercentTween.evaluate(animation),
              widget.fabSize,
              widget.fabMargin,
              additionalBottomPadding,
              widget.bgColor,
              widget.fabBgColor,
            ),
            size: Size(
              double.infinity,
              widget.navHeight + (widget.fabSize / 2) + additionalBottomPadding,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: widget.navHeight,
              margin: EdgeInsets.only(bottom: additionalBottomPadding),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: widget.items.asMap().entries.map((entry) {
                  final pos = entry.key;
                  final iconWidget = entry.value;
                  return Expanded(
                    child: InkWell(
                      splashColor: Colors.white,
                      highlightColor: Colors.white,
                      onTap: () {
                        widget.onItemClick(pos);
                      },
                      child: Transform.translate(
                        offset: Offset(0, _itemsTranslationY[pos].evaluate(animation)),
                        child: iconWidget,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void forEachTween(visitor) {
    double itemSpace = 1 / widget.items.length;
    double selectedPercent = (itemSpace * widget.selected) + (itemSpace / 2);

    _selectedPercentTween = visitor(
      _selectedPercentTween,
      selectedPercent,
      (dynamic value) => Tween<double>(
        begin: value,
      ),
    );

    for (int i = 0; i < _itemsTranslationY.length; i++) {
      bool isSelected = widget.selected == i;
      _itemsTranslationY[i] = visitor(
        _itemsTranslationY[i],
        isSelected ? -(widget.fabSize / 2) - (widget.fabMargin / 2) : 0.0,
        (dynamic value) => Tween<double>(
          begin: value,
        ),
      );
    }
  }
}

class _MyBottomNavigationCustomPainter extends CustomPainter {
  final double targetXPercent;
  final double fabSize;
  final double fabMargin;
  final double additionalBottomPadding;
  final Color bgColor;
  final Color fabBgColor;
  final Paint bgPaint;
  final Paint fabPaint;

  _MyBottomNavigationCustomPainter(
    this.targetXPercent,
    this.fabSize,
    this.fabMargin,
    this.additionalBottomPadding,
    this.bgColor,
    this.fabBgColor,
  )   : bgPaint = Paint()
          ..isAntiAlias = true
          ..color = bgColor
          ..style = PaintingStyle.fill,
        fabPaint = Paint()
          ..isAntiAlias = true
          ..color = fabBgColor
          ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    double holeWidth = 100;
    double holeWidthThird = (holeWidth / 3) * 2;
    double holeHeight = fabSize + fabMargin;

    double top = fabSize / 2;

    Path bgPath = new Path();

    final targetX = size.width * targetXPercent;

    bgPath.moveTo(0, top);

    final point1 = Offset(targetX - holeWidthThird, top);
    bgPath.lineTo(point1.dx, point1.dy);

    final point2 = Offset(targetX, holeHeight);

    final controlPoint1 = Offset(point1.dx + 25, top);
    final controlPoint2 = Offset(point1.dx + 30, holeHeight);

    bgPath.cubicTo(
      controlPoint1.dx,
      controlPoint1.dy,
      controlPoint2.dx,
      controlPoint2.dy,
      point2.dx,
      point2.dy,
    );

    final point3 = Offset(targetX + holeWidthThird, top);
    final controlPoint3 = Offset(point3.dx - 30, holeHeight);
    final controlPoint4 = Offset(point3.dx - 25, top);

    bgPath.cubicTo(
      controlPoint3.dx,
      controlPoint3.dy,
      controlPoint4.dx,
      controlPoint4.dy,
      point3.dx,
      point3.dy,
    );

    bgPath.lineTo(size.width, top);
    bgPath.lineTo(size.width, size.height);
    bgPath.lineTo(0, size.height);
    bgPath.lineTo(0, top);

    canvas.clipRect(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawPath(bgPath, bgPaint);

    canvas.drawCircle(Offset(targetX, fabSize / 2), fabSize / 2, fabPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

}
