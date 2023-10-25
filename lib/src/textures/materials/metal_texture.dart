import 'dart:math';

import 'package:flutter/material.dart';

class MetalTextureRenderObject extends RenderBox {
  @override
  void performLayout() {
    size = constraints.biggest;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    // Base gradient to simulate a metallic sheen
    final gradient = LinearGradient(
      colors: [Colors.grey[800]!, Colors.grey[600]!, Colors.grey[800]!],
      stops: const [0.0, 0.5, 1.0],
    ).createShader(
      Rect.fromPoints(Offset.zero, Offset(size.width, size.height)),
    );

    final paint = Paint()
      ..shader = gradient
      ..style = PaintingStyle.fill;

    canvas.drawRect(offset & size, paint);

    // Adding noise for texture
    final random = Random();
    final noisePaint = Paint()..color = Colors.white.withOpacity(0.05);

    for (var i = 0; i < 500; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      canvas.drawCircle(Offset(x, y), 1, noisePaint);
    }
  }
}
