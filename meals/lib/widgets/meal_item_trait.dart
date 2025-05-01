// lib/widgets/meal_item_trait.dart

import 'package:flutter/material.dart';

/// A small reusable widget that displays an icon with a text label,
/// styled for use in meal-related UI elements.
class MealItemTrait extends StatelessWidget {
  final IconData icon;
  final String label;

  const MealItemTrait({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      // Combines icon and label horizontally for trait display
      children: [
        Icon(
          icon,
          size: 17,
          color: Colors.white, // Assumes dark background
        ),
        const SizedBox(width: 6), // Spacing between icon and label
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
