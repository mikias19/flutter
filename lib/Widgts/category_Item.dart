import 'package:flutter/material.dart';
import 'package:meal/Datas/meal_data.dart';
import 'package:meal/Models/category.dart';
import "package:meal/Screens/meal_screen.dart";

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onSelectedCategory,
  });
  final Category category;

  final void Function(BuildContext context, Category category)
      onSelectedCategory;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.65),
              category.color.withOpacity(0.99)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {
          onSelectedCategory(
            context,
            category,
          );
        },
        borderRadius: BorderRadius.circular(16),
        splashColor: category.color.withOpacity(0.8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer),
          ),
        ),
      ),
    );
  }
}
