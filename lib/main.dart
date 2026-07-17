import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';

void main() {
  runApp(const CareCubeApp());
}

class CareCubeApp extends StatelessWidget {
  const CareCubeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Care Cube',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF16796F),
        ),
        scaffoldBackgroundColor: const Color(0xFFF6FAF9),
      ),
      home: const SplashScreen(),
    );
  }
}