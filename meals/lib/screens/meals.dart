// lib/screens/meals.dart

import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });

  final String? title;
  final List<Meal> meals;

  // Navigates to the meal details screen
  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(meal: meal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Fallback message when no meals are available
    Widget content = meals.isEmpty
        ? Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh ... nothing here!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Try selecting a different category!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ],
      ),
    )
        : ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) => MealItem(
        meal: meals[index],
        onSelectMeal: (meal) => selectMeal(context, meal),
      ),
    );

    // Return only content if there's no title (e.g., in tab view)
    if (title == null) {
      return content;
    }

    // Wrap in Scaffold if used with a title (e.g., after category selection)
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
