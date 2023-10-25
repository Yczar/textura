// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:textura/src/enums/textura_type.dart';
import 'package:textura/textura.dart';

void main() {
  group('Textura', () {
    test('can be instantiated', () {
      expect(
        Textura(
          textureType: TextureType.asphalt,
        ),
        isNotNull,
      );
    });
  });
}
