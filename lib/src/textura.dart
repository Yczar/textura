import 'package:flutter/material.dart';
import 'package:textura/src/enums/textura_type.dart';
import 'package:textura/src/extensions/texture_type_extension.dart';
import 'package:textura/src/textures/patterns/honeycomb.dart';

/// `Textura` is a widget that applies a texture as a background to its child
/// widget.
/// It takes a `TextureType` as a required parameter to determine which texture
/// to apply.
///
/// Sample Usage:
/// ```dart
/// Textura(
///   textureType: TextureType.asphalt,
///   child: YourWidget(),
/// )
/// ```
/// In this usage, `YourWidget()` will be displayed with an asphalt texture
/// applied as its background.
class Textura extends SingleChildRenderObjectWidget {
  /// Constructs a `Textura` widget.
  ///
  /// The [textureType] determines which texture is applied as a background to
  /// the [child].
  const Textura({
    required this.textureType,
    super.key,
    super.child,
  })  : _hexSize = null,
        _strokeColor = null,
        _fillColor = null,
        _strokeWidth = null,
        _useRandomColors = null;

  const Textura.honeycomb({
    double hexSize = 15.0,
    Color strokeColor = Colors.amber,
    Color fillColor = const Color(0x1AFFB300),
    double strokeWidth = 2.0,
    bool useRandomColors = false,
    super.key,
    super.child,
  })  : textureType = TextureType.honeycomb,
        _hexSize = hexSize,
        _strokeColor = strokeColor,
        _fillColor = fillColor,
        _strokeWidth = strokeWidth,
        _useRandomColors = useRandomColors;

  /// The type of texture to be applied.
  final TextureType textureType;

  // Private honeycomb-specific parameters (only set in honeycomb constructor)
  final double? _hexSize;
  final Color? _strokeColor;
  final Color? _fillColor;
  final double? _strokeWidth;
  final bool? _useRandomColors;

  /// Creates the `RenderObject` that applies the texture.
  ///
  /// It fetches the appropriate `RenderBox` based on [textureType]
  /// to render the texture.
  @override
  RenderObject createRenderObject(BuildContext context) {
    // Pass parameters to honeycomb render object
    if (textureType == TextureType.honeycomb) {
      return RenderHoneycomb(
        hexSize: _hexSize ?? 20.0,
        strokeColor: _strokeColor ?? Colors.amber,
        fillColor: _fillColor ?? const Color(0x1AFFB300),
        strokeWidth: _strokeWidth ?? 2.0,
        useRandomColors: _useRandomColors ?? false,
      );
    }

    // For other texture types, use the enum's renderObject
    return textureType.renderObject;
  }
}
