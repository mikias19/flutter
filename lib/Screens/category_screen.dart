import 'package:flutter/material.dart';
import 'package:meal/Datas/meal_data.dart';
import 'package:meal/Models/category.dart';
import "package:meal/Screens/meal_screen.dart";
import 'package:meal/Widgts/category_Item.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key, required this.category});
  final List<Category> category;
  void _onSelectedCategoty(BuildContext context, Category category) {
    final filteredMeal =
        meals.where((meal) => meal.categories.contains(category.id)).toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) =>
            MealsScreen(meals: filteredMeal, categoryTitle: category.title)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pick Your Category",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.onPrimary)),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: category.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        itemBuilder: (ctx, index) => CategoryGridItem(
          category: category[index],
          onSelectedCategory: _onSelectedCategoty,
        ),
      ),
    );
  }
}
