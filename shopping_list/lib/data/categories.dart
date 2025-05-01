// File: lib/data/categories.dart

import 'package:flutter/material.dart';
import 'package:shopping_list/models/category.dart';

/// A constant map linking each `Categories` enum to a [Category] instance.
/// Each category has a label and a specific color.
const categories = {
  Categories.vegetables: Category(
    'Vegetables',
    Color.fromARGB(255, 0, 255, 128), // Greenish
  ),
  Categories.fruit: Category(
    'Fruit',
    Color.fromARGB(255, 145, 255, 0), // Lime
  ),
  Categories.meat: Category(
    'Meat',
    Color.fromARGB(255, 255, 102, 0), // Orange-red
  ),
  Categories.dairy: Category(
    'Dairy',
    Color.fromARGB(255, 0, 208, 255), // Sky blue
  ),
  Categories.carbs: Category(
    'Carbs',
    Color.fromARGB(255, 0, 60, 255), // Deep blue
  ),
  Categories.sweets: Category(
    'Sweets',
    Color.fromARGB(255, 255, 149, 0), // Orange
  ),
  Categories.spices: Category(
    'Spices',
    Color.fromARGB(255, 255, 187, 0), // Yellow-orange
  ),
  Categories.convenience: Category(
    'Convenience',
    Color.fromARGB(255, 191, 0, 255), // Purple
  ),
  Categories.hygiene: Category(
    'Hygiene',
    Color.fromARGB(255, 149, 0, 255), // Violet
  ),
  Categories.other: Category(
    'Other',
    Color.fromARGB(255, 0, 225, 255), // Cyan
  ),
};
