import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlutterChat'), // App title shown during splash
      ),
      body: const Center(
        child: Text('Loading...'), // Splash message shown while app initializes
      ),
    );
  }
}