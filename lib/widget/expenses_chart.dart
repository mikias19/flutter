import "package:expenses_tracker/model/expense.dart";
import 'package:expenses_tracker/widget/bar_chart_painter.dart';
import "package:flutter/material.dart";

class CustomExpenseChart extends StatelessWidget {
  final List<Expense> expenses;

  CustomExpenseChart({super.key, required this.expenses});

  Map<Category, double> _calculateCategoryTotals() {
    Map<Category, double> categoryTotals = {
      for (var category in Category.values) category: 0.0
    };

    for (var expense in expenses) {
      categoryTotals[expense.category] =
          categoryTotals[expense.category]! + expense.amount;
    }

    return categoryTotals;
  }

  double _calculateTotalAmount() {
    return expenses.fold(0.0, (sum, expense) => sum + expense.amount);
  }

  @override
  Widget build(BuildContext context) {
    final categoryTotals = _calculateCategoryTotals();
    final totalAmount = _calculateTotalAmount();
    final chartHeight = 200.0;
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "Expense Distribution by Category",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            height: chartHeight,
            child: CustomPaint(
              painter: BarChartPainter(categoryTotals, totalAmount),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...Category.values.map((category) {
                return Column(
                  children: [
                    Icon(
                      getCatgoryIcon(category),
                      size: 24,
                    ),
                    Text(category.name),
                  ],
                );
              }).toList()
            ],
          )
        ],
      ),
    );
  }
}
