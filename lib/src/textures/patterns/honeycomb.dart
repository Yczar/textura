import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Custom RenderObject that draws the honeycomb pattern
class RenderHoneycomb extends RenderBox
    with RenderObjectWithChildMixin<RenderBox> {
  RenderHoneycomb({
    required double hexSize,
    required Color strokeColor,
    required Color fillColor,
    required double strokeWidth,
    required bool useRandomColors,
  })  : _hexSize = hexSize,
        _strokeColor = strokeColor,
        _fillColor = fillColor,
        _strokeWidth = strokeWidth,
        _useRandomColors = useRandomColors;
  double _hexSize;
  Color _strokeColor;
  Color _fillColor;
  double _strokeWidth;
  bool _useRandomColors;
  final math.Random _random = math.Random(42);

  // Getters and setters with marking for repaint
  double get hexSize => _hexSize;
  set hexSize(double value) {
    if (_hexSize == value) return;
    _hexSize = value;
    markNeedsPaint();
  }

  Color get strokeColor => _strokeColor;
  set strokeColor(Color value) {
    if (_strokeColor == value) return;
    _strokeColor = value;
    markNeedsPaint();
  }

  Color get fillColor => _fillColor;
  set fillColor(Color value) {
    if (_fillColor == value) return;
    _fillColor = value;
    markNeedsPaint();
  }

  double get strokeWidth => _strokeWidth;
  set strokeWidth(double value) {
    if (_strokeWidth == value) return;
    _strokeWidth = value;
    markNeedsPaint();
  }

  bool get useRandomColors => _useRandomColors;
  set useRandomColors(bool value) {
    if (_useRandomColors == value) return;
    _useRandomColors = value;
    markNeedsPaint();
  }

  @override
  void performLayout() {
    size = constraints.biggest;

    // If there's a child, lay it out
    if (child != null) {
      child!.layout(constraints, parentUsesSize: false);
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas
      ..save()
      ..translate(offset.dx, offset.dy);

    // Calculate hexagon dimensions
    // For a flat-topped hexagon, the width is 2 * size
    // and the height is sqrt(3) * size
    final hexWidth = _hexSize * 2;
    final hexHeight = math.sqrt(3) * _hexSize;

    // Horizontal and vertical spacing between hexagons
    final horizSpacing = hexWidth / 2;
    final vertSpacing = hexHeight * 2;

    // Calculate how many hexagons we need
    final numCols = (size.width / horizSpacing).ceil() + 2;
    final numRows = (size.height / vertSpacing).ceil() + 2;

    // Create paints
    final fillPaint = Paint()..style = PaintingStyle.fill;

    final strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = _strokeWidth;

    // Draw all hexagons
    for (var row = -1; row < numRows; row++) {
      for (var col = -1; col < numCols; col++) {
        final xOffset = col * horizSpacing;
        final yOffset = row * vertSpacing + (col.isOdd ? vertSpacing / 2 : 0);

        // Set colors based on random or uniform mode
        if (_useRandomColors) {
          final hue = _random.nextDouble() * 60 + 30;
          fillPaint.color = HSVColor.fromAHSV(0.3, hue, 0.7, 0.9).toColor();
          strokePaint.color = Colors.amber.withValues(alpha: 0.5);
        } else {
          fillPaint.color = _fillColor;
          strokePaint.color = _strokeColor;
        }

        final hexPath = _createHexagonPath(xOffset, yOffset, _hexSize);

        // Draw filled hexagon
        canvas
          ..drawPath(hexPath, fillPaint)
          // Draw hexagon border
          ..drawPath(hexPath, strokePaint);
      }
    }

    canvas.restore();

    // Paint the child on top if it exists
    if (child != null) {
      context.paintChild(child!, offset);
    }
  }

  Path _createHexagonPath(double x, double y, double size) {
    final path = Path();

    for (var i = 0; i < 6; i++) {
      final angle = (math.pi / 3) * i - math.pi / 2;
      final px = x + size * math.cos(angle);
      final py = y + size * math.sin(angle);

      if (i == 0) {
        path.moveTo(px, py);
      } else {
        path.lineTo(px, py);
      }
    }

    path.close();
    return path;
  }

  @override
  bool hitTestSelf(Offset position) => true;

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    return child?.hitTest(result, position: position) ?? false;
  }
}
