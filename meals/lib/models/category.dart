// File: lib/models/category.dart

import 'package:flutter/material.dart';

/// Model representing a meal category.
class Category {
  Category({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });

  /// Unique identifier for the category.
  final String id;

  /// Display title for the category.
  final String title;

  /// Color associated with the category (used for UI).
  final Color color;
}
