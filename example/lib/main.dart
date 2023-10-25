import 'package:flutter/material.dart';
import 'package:textura/textura.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<TextureType> textureNotifier =
      ValueNotifier(TextureType.asphalt);

  void _nextTexture() {
    final currentIndex = TextureType.values.indexOf(textureNotifier.value);
    final nextIndex = (currentIndex + 1) % TextureType.values.length;
    textureNotifier.value = TextureType.values[nextIndex];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _nextTexture,
        child: const Icon(Icons.refresh),
      ),
      body: ValueListenableBuilder<TextureType>(
        valueListenable: textureNotifier,
        builder: (context, textureType, child) {
          return Textura(
            textureType: textureType,
            child: SizedBox(
              height: size.height,
              width: size.width,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    textureNotifier.dispose();
    super.dispose();
  }
}
