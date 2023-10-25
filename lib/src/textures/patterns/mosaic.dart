import 'dart:math';

import 'package:flutter/rendering.dart';

class MosaicTextureRenderObject extends RenderProxyBox {
  @override
  bool hitTestSelf(Offset position) => true;

  @override
  void paint(PaintingContext context, Offset offset) {
    context.canvas.save();
    context.canvas.translate(offset.dx, offset.dy);

    final random = Random(0);
    const mosaicTileSize = 20.0;

    // Drawing mosaic tiles
    for (var x = 0.0; x < size.width; x += mosaicTileSize) {
      for (var y = 0.0; y < size.height; y += mosaicTileSize) {
        final mosaicPaint = Paint()
          ..color = Color.fromRGBO(
            random.nextInt(256),
            random.nextInt(256),
            random.nextInt(256),
            1,
          );
        context.canvas.drawRect(
          Rect.fromLTWH(x, y, mosaicTileSize, mosaicTileSize),
          mosaicPaint,
        );
      }
    }

    context.canvas.restore();

    super.paint(context, offset);
  }
}
