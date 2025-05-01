// File: lib/models/category.dart

import 'package:flutter/material.dart';

/// Enum listing all possible grocery categories.
enum Categories {
  vegetables,
  fruit,
  meat,
  dairy,
  carbs,
  sweets,
  spices,
  convenience,
  hygiene,
  other,
}

/// Model class representing a single category.
class Category {
  const Category(this.title, this.color);

  /// Display name of the category.
  final String title;

  /// Associated color for UI representation.
  final Color color;
}
