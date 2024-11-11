import 'package:flutter/material.dart';
import 'package:meal/Datas/category_data.dart';
import 'package:meal/Datas/meal_data.dart';
import 'package:meal/Models/meal.dart';
import "package:meal/Screens/category_screen.dart";
import 'package:meal/Screens/meal_screen.dart';

class TabScreen extends StatefulWidget {
  @override
  State<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  int _currentIndex = 0;

  final List<Meal> favorites = [];

  String activeTitle = "Your Category";
  void _onToogleFavorite(Meal meal) {
    final isExisting = favorites.contains(meal);

    setState(() {
      if (isExisting) {
        favorites.remove(meal);
      } else {
        favorites.add(meal);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoryScreen(
      category: categories,
      toogleFavorite: _onToogleFavorite,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          activeTitle,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).primaryColorDark),
        ),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          if (_currentIndex == 0) {
            activePage = CategoryScreen(
              category: categories,
              toogleFavorite: _onToogleFavorite,
            );
            activeTitle = "Your Category";
          } else {
            activePage = MealsScreen(
                meals: favorites, toogleFavorite: _onToogleFavorite);
            activeTitle = "Meals";
          }
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Category"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
        ],
      ),
    );
  }
}
