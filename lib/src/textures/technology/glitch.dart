import 'dart:async';
import 'dart:math';

import 'package:flutter/rendering.dart';

class GlitchRenderObject extends RenderProxyBox {
  GlitchRenderObject() {
    _timer = Timer.periodic(const Duration(milliseconds: 50), (Timer t) {
      if (_random.nextInt(10) < 7) {
        markNeedsPaint();
      }
    });
  }
  final Random _random = Random();
  late Timer _timer;

  @override
  void detach() {
    _timer.cancel();
    super.detach();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    // Number of slices
    final slices = 5 + _random.nextInt(5);

    for (var i = 0; i < slices; i++) {
      final from = size.height / slices * i;
      final to = size.height / slices * (i + 1);

      final glitchOffset = (_random.nextDouble() - 0.5) * 20.0;

      canvas
        ..save()
        ..clipRect(
          Rect.fromLTRB(
            offset.dx,
            offset.dy + from,
            offset.dx + size.width,
            offset.dy + to,
          ),
        )
        ..translate(glitchOffset, 0);
      super.paint(context, offset);
      canvas.restore();
    }
  }
}
