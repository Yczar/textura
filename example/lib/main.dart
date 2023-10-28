import 'package:flutter/material.dart';
import 'package:textura/textura.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  MainAppState createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TextureSelectionScreen(),
    );
  }
}

class TextureSelectionScreen extends StatelessWidget {
  const TextureSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select a Texture')),
      body: ListView.builder(
        itemCount: TextureType.values.length,
        itemBuilder: (context, index) {
          final texture = TextureType.values[index];
          return ListTile(
            title: Text(texture.toString().split('.').last),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    TextureDisplayScreen(textureType: texture),
              ));
            },
          );
        },
      ),
    );
  }
}

class TextureDisplayScreen extends StatelessWidget {
  final TextureType textureType;

  const TextureDisplayScreen({super.key, required this.textureType});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('Texture Display')),
      body: SafeArea(
        child: Stack(
          children: [
            Textura(
              textureType: textureType,
              child: SizedBox(
                height: size.height,
                width: size.width,
              ),
            ),
            Center(
              child: Text(
                textureType.toString().split('.').last,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
