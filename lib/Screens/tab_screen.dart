import 'package:flutter/material.dart';
import 'package:meal/Datas/category_data.dart';
import 'package:meal/Datas/meal_data.dart';
import 'package:meal/Models/meal.dart';
import "package:meal/Screens/category_screen.dart";
import 'package:meal/Screens/meal_screen.dart';
import "package:meal/Widgts/drawer_handler.dart";

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

    void showMessage(String text) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
    }

    setState(() {
      if (isExisting) {
        favorites.remove(meal);
        showMessage("Meal is Removed");
      } else {
        favorites.add(meal);
        showMessage("Meal is Added");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoryScreen(
      category: categories,
      toogleFavorite: _onToogleFavorite,
    );

    if (_currentIndex == 1) {
      activePage =
          MealsScreen(meals: favorites, toogleFavorite: _onToogleFavorite);
      activeTitle = "Meals";
    }
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
      drawer: DrawerHandler(),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
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
