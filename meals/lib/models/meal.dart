// File: lib/models/meal.dart

/// Represents the preparation complexity of a meal.
enum Complexity {
  simple,
  challenging,
  hard,
}

/// Represents the cost level of a meal.
enum Affordability {
  affordable,
  pricey,
  luxurious,
}

/// Model representing a meal with full details.
class Meal {
  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });

  /// Unique meal identifier.
  final String id;

  /// Associated category IDs.
  final List<String> categories;

  /// Display title of the meal.
  final String title;

  /// URL of the meal image.
  final String imageUrl;

  /// List of ingredients.
  final List<String> ingredients;

  /// Step-by-step preparation instructions.
  final List<String> steps;

  /// Preparation time in minutes.
  final int duration;

  /// Complexity level of the meal.
  final Complexity complexity;

  /// Affordability level of the meal.
  final Affordability affordability;

  /// Whether the meal is gluten-free.
  final bool isGlutenFree;

  /// Whether the meal is lactose-free.
  final bool isLactoseFree;

  /// Whether the meal is vegan.
  final bool isVegan;

  /// Whether the meal is vegetarian.
  final bool isVegetarian;
}
