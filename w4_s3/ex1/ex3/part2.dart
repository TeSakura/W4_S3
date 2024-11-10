import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImageGallery(),
    );
  }
}

class ImageGallery extends StatefulWidget {
  const ImageGallery({super.key});

  @override
  _ImageGalleryState createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  // List of image paths
  final List<String> _images = [
    'assets/w4_s2/dice-1.png',
    'assets/w4_s2/dice-2.png',
    'assets/w4_s2/dice-3.png',
  ];

  int _currentIndex = 0;

  // Function to go to the previous image
  void _previousImage() {
    setState(() {
      _currentIndex = (_currentIndex - 1 + _images.length) % _images.length;
    });
  }

  // Function to go to the next image
  void _nextImage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Viewer'),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: _previousImage,
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: _nextImage,
          ),
        ],
      ),
      body: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: Image.asset(
            _images[_currentIndex],
            key: ValueKey<int>(_currentIndex),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}
