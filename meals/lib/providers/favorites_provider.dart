// File: lib/providers/favorite_meals_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

/// A [StateNotifier] that manages the list of favorite meals.
class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  /// Toggles the favorite status of a meal.
  /// Returns `true` if the meal was added, `false` if removed.
  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

/// Provider for managing the user's favorite meals list.
final favoriteMealsProvider =
StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
