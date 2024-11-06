import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:uuid/uuid.dart";

final uuid = Uuid();

class Expense {
  final String id;
  final String title;
  final double amount;
  final Category category;
  final DateTime date;

  Expense(
      {required this.title,
      required this.amount,
      required this.category,
      required this.date})
      : id = uuid.v4();

  String get formatedDate {
    return DateFormat("yMd").format(date);
  }
}

enum Category { food, leisure, work, travel }

IconData getCatgoryIcon(Category category) {
  switch (category) {
    case Category.work:
      return Icons.work;
    case Category.food:
      return Icons.food_bank;
    case Category.leisure:
      return Icons.shopify;
    case Category.travel:
      return Icons.flight;
    default:
      return Icons.help;
  }
}
