import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BubbleTextureRenderObject extends RenderProxyBox {
  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    context.canvas.save();
    context.canvas.translate(offset.dx, offset.dy);

    final random = Random(0);
    const numberOfBubbles = 100;

    // Drawing bubbles
    for (var i = 0; i < numberOfBubbles; i++) {
      final bubbleDiameter = random.nextDouble() * 50;
      final bubbleX = random.nextDouble() * size.width;
      final bubbleY = random.nextDouble() * size.height;
      final bubbleOpacity = random.nextDouble();

      final bubblePaint = Paint()
        ..color = Colors.blue.withValues(alpha: bubbleOpacity)
        ..style = PaintingStyle.fill;

      context.canvas.drawCircle(
        Offset(bubbleX, bubbleY),
        bubbleDiameter / 2,
        bubblePaint,
      );
    }

    context.canvas.restore();

    super.paint(context, offset);
  }
}
