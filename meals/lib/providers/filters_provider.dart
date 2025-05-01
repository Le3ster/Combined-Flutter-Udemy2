// File: lib/providers/filters_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meals_provider.dart';

/// Enum representing dietary filter options.
enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

/// Notifier for managing active filter states.
class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegetarian: false,
    Filter.vegan: false,
  });

  /// Replaces all current filters with [chosenFilters].
  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  /// Updates a single [filter] to [isActive].
  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

/// Provider for managing filter state.
final filtersProvider =
StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
      (ref) => FiltersNotifier(),
);

/// Returns the list of meals filtered by active [filtersProvider] state.
final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);

  return meals.where((meal) {
    if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) return false;
    if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) return false;
    if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) return false;
    if (activeFilters[Filter.vegan]! && !meal.isVegan) return false;
    return true;
  }).toList();
});
