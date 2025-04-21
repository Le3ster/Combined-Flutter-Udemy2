import 'package:flutter/material.dart';
import 'package:roll_dice_1/gradient_container.dart';

/// Entry point of the Flutter application.
void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner
      home: Scaffold(
        body: GradientContainer(
          Color.fromARGB(255, 133, 132, 172),
          Color.fromARGB(255, 111, 109, 168),
        ),
      ),
    ),
  );
}
