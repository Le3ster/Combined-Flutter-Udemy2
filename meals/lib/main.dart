import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:meals/screens/tabs.dart';

/// Global app theme using Material 3 and dark color scheme.
final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0), // Earthy brown base
  ),
  textTheme: GoogleFonts.latoTextTheme(), // Applies Lato to all text
);

void main() {
  // Wraps app with Riverpod provider system
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

/// Root widget for the app
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme, // Applies the custom theme to the app
      home: const TabsScreen(), // Launch point to main tab navigation
    );
  }
}
