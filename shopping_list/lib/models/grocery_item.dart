// File: lib/models/grocery_item.dart

import 'package:shopping_list/models/category.dart';

/// Represents a single grocery item entry.
class GroceryItem {
  const GroceryItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.category,
  });

  /// Unique identifier for the item.
  final String id;

  /// Name of the grocery item.
  final String name;

  /// Quantity of the item to purchase.
  final int quantity;

  /// Associated category for the item.
  final Category category;
}
