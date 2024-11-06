import 'package:flutter/material.dart';
import "package:expenses_tracker/model/expense.dart";

class BarChartPainter extends CustomPainter {
  final Map<Category, double> categoryTotals;
  final double totalAmount;

  BarChartPainter(this.categoryTotals, this.totalAmount);

  @override
  void paint(Canvas canvas, Size size) {
    final barWidth = size.width / (categoryTotals.length * 2);
    final paint = Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.fill;

    final double maxBarHeight = size.height;

    categoryTotals.entries.toList().asMap().forEach((index, entry) {
      final category = entry.key;
      final amount = entry.value;
      final double barHeight =
          totalAmount > 0 ? (amount / totalAmount) * maxBarHeight : 0;

      final double left = index * 2 * barWidth;
      final double top = size.height - barHeight;
      final double right = left + barWidth;
      final double bottom = size.height;

      canvas.drawRect(Rect.fromLTRB(left, top, right, bottom), paint);
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
