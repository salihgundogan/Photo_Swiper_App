import 'package:flutter/material.dart';

void main() {
  runApp(PhotoSwiperApp());
}

class PhotoSwiperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PhotoSwiperScreen(),
    );
  }
}

class PhotoSwiperScreen extends StatefulWidget {
  @override
  _PhotoSwiperScreenState createState() => _PhotoSwiperScreenState();
}

class _PhotoSwiperScreenState extends State<PhotoSwiperScreen> {
  final List<String> imagePaths = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
    'assets/images/5.jpg',
  ];

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: 100); // Yüksek bir sayfadan başlat
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Infinite Photo Swiper')),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          // Döngü etkisi için mod (%) işlemi kullanılır
          final imageIndex = index % imagePaths.length;
          return Image.asset(
            imagePaths[imageIndex],
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
