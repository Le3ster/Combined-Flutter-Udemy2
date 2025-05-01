// File: lib/providers/meals_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';

/// Provides the list of all available meals from the dummy data.
final mealsProvider = Provider((ref) {
  return dummyMeals;
});
