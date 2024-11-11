import 'package:flutter/material.dart';
import 'package:meal/Datas/meal_data.dart';
import 'package:meal/Models/category.dart';
import 'package:meal/Models/meal.dart';
import 'package:meal/Widgts/meal_item.dart';

import "package:meal/Widgts/meal_specification_info.dart";
import "package:meal/Screens/meal_details_screen.dart";

class MealsScreen extends StatelessWidget {
  final List<Meal> meals;
  final String? categoryTitle;
  final void Function(Meal meal) toogleFavorite;
  MealsScreen(
      {super.key,
      required this.meals,
      this.categoryTitle,
      required this.toogleFavorite});

  void selectingMealDetail(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) =>
            MealDetailScreen(meal: meal, onToogleFavorite: toogleFavorite)));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) {
        final filteredmeal = meals[index];
        return MealItem(
            filteredmeal: filteredmeal,
            selectingMealDetail: selectingMealDetail);
      },
    );
    if (meals.isEmpty) {
      content = const Center(
          child: Column(children: [
        Text("Upps :)..nothing is here ",
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold)),
        Text("Try Selcting Another Category")
      ]));
    }

    if (categoryTitle != "") return content;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle!,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
      ),
      body: content,
    );
  }
}
