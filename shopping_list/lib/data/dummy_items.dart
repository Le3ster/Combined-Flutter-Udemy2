// File: lib/data/grocery_items.dart

import 'package:shopping_list/models/category.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/data/categories.dart';

/// A predefined list of grocery items.
/// Each [GroceryItem] is linked to a [Category] from the `categories` map.
final groceryItems = [
  GroceryItem(
    id: 'a',
    name: 'Milk',
    quantity: 1,
    category: categories[Categories.dairy]!, // Dairy category
  ),
  GroceryItem(
    id: 'b',
    name: 'Bananas',
    quantity: 5,
    category: categories[Categories.fruit]!, // Fruit category
  ),
  GroceryItem(
    id: 'c',
    name: 'Beef Steak',
    quantity: 1,
    category: categories[Categories.meat]!, // Meat category
  ),
];
