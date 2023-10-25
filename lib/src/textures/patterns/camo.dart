import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CamoTextureRenderObject extends RenderProxyBox {
  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    context.canvas.save();
    context.canvas.translate(offset.dx, offset.dy);

    final random = Random(0);

    final camoColors = <Color>[
      Colors.green[800]!,
      Colors.green[700]!,
      Colors.green[600]!,
      Colors.brown[700]!,
    ];

    // Drawing random shapes to simulate the camouflage pattern
    for (var i = 0; i < 100; i++) {
      final camoPaint = Paint()
        ..color = camoColors[random.nextInt(camoColors.length)]
        ..style = PaintingStyle.fill;

      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final radius = random.nextDouble() * 20;

      context.canvas.drawCircle(Offset(x, y), radius, camoPaint);
    }

    context.canvas.restore();

    super.paint(context, offset);
  }
}
