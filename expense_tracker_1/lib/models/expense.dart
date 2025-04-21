import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMd();
const uuid = Uuid();

/// Enum representing the different expense categories.
enum Category { food, travel, leisure, work }

/// Mapping from categories to their corresponding icons.
const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

/// Represents a single expense item.
class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4(); // Generates a unique ID

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  /// Returns the formatted date string.
  String get formattedDate {
    return formatter.format(date);
  }
}

/// Groups expenses by category.
class ExpenseBucket {
  ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  /// Factory constructor to create a bucket from all expenses for a given category.
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
      .where((expense) => expense.category == category)
      .toList();

  final Category category;
  final List<Expense> expenses;

  /// Computes the total expenses in this bucket.
  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
