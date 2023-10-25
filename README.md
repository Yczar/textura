# Textura 🎨

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)
[![License: MIT][license_badge]][license_link]

A Flutter package that beautifies your widgets with a variety of advanced textures. Wrap any widget in `Textura` to apply a stunning background texture, choosing from a diverse and unique collection of designs.

## 🌟 Features

- **Vast Collection**: Choose from an extensive list of textures such as asphalt, camo, denim, marble, and more.
- **Ease of Use**: Simply wrap your widget with `Textura` and select a texture.
- **Custom Render Objects**: Advanced implementation using custom render objects for fine-grained control over the painting process.

## 🎨 Available Textures

- asphalt
- brick_wall
- bubble
- camo
- canvas
- celtic_knots
- chequered
- chessboard
- circuitry
- city_maps
- clouds
- concrete
- constellations
- denim
- dna
- fabric_texture
- foam
- furry
- galaxy
- game_pixels
- glitch
- graffiti
- granite
- graph_paper
- grass
- greek_keys
- grid
- holographic
- honeycomb
- leather
- leaves
- leopard
- linen
- marble
- metal_texture
- mosaic
- mud
- music_sheet
- newsprint
- paper
- perforated_metal
- roadways
- rough_tile
- rubber
- rusted_metal
- sand
- silk
- solar_system
- spider_web
- spirals
- star
- steel
- suede
- sunset
- train_tracks
- water
- wood_grain
- zebra

## Installation 💻

**❗ In order to start using Textura you must have the [Flutter SDK][flutter_install_link] installed on your machine.**

### Install via `flutter pub add`:

```sh
dart pub add textura
```

### Import the Package:

```dart
import 'package:textura/textura.dart';
```

### Wrap Your Widget:

```dart
Textura(
  textureType: TextureType.asphalt,
  child: YourWidget(),
)
```

## 🌈 Examples

Here are a few examples of how you can use Textura to enhance your widgets:

### Asphalt Texture

```dart
Textura(
  textureType: TextureType.asphalt,
  child: YourWidget(),
)
```

### Bubble Texture

```dart
Textura(
  textureType: TextureType.asphalt,
  child: YourWidget(),
)
```

## Continuous Integration 🤖

Textura comes with a built-in [GitHub Actions workflow][github_actions_link] powered by [Very Good Workflows][very_good_workflows_link] but you can also add your preferred CI/CD solution.

Out of the box, on each pull request and push, the CI `formats`, `lints`, and `tests` the code. This ensures the code remains consistent and behaves correctly as you add functionality or make changes. The project uses [Very Good Analysis][very_good_analysis_link] for a strict set of analysis options used by our team. Code coverage is enforced using the [Very Good Workflows][very_good_coverage_link].

---

[flutter_install_link]: https://docs.flutter.dev/get-started/install
[github_actions_link]: https://docs.github.com/en/actions/learn-github-actions
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[logo_black]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_black.png#gh-light-mode-only
[logo_white]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_white.png#gh-dark-mode-only
[mason_link]: https://github.com/felangel/mason
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://pub.dev/packages/very_good_cli
[very_good_coverage_link]: https://github.com/marketplace/actions/very-good-coverage
[very_good_ventures_link]: https://verygood.ventures
[very_good_ventures_link_light]: https://verygood.ventures#gh-light-mode-only
[very_good_ventures_link_dark]: https://verygood.ventures#gh-dark-mode-only
[very_good_workflows_link]: https://github.com/VeryGoodOpenSource/very_good_workflows

```

```
