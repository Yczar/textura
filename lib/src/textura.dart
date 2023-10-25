import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:textura/src/enums/textura_type.dart';
import 'package:textura/src/extensions/texture_type_extension.dart';

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
  });

  /// The type of texture to be applied.
  final TextureType textureType;

  /// Creates the `RenderObject` that applies the texture.
  ///
  /// It fetches the appropriate `RenderBox` based on [textureType]
  /// to render the texture.
  @override
  RenderObject createRenderObject(BuildContext context) {
    return textureType.renderObject;
  }

  /// Updates the RenderObject during the widget update phase.
  /// It modifies the child of the existing RenderObject to the new RenderObject
  /// based on the updated [textureType].
  @override
  void updateRenderObject(
    BuildContext context,
    covariant RenderProxyBox renderObject,
  ) {
    renderObject.child = textureType.renderObject;
  }
}
