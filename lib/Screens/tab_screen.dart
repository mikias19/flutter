import 'package:flutter/material.dart';
import 'package:meal/Datas/category_data.dart';
import "package:meal/Screens/category_screen.dart";
import 'package:meal/Screens/meal_screen.dart';

class TabScreen extends StatefulWidget {
  @override
  State<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  final pages = [
    CategoryScreen(category: categories),
    MealsScreen(meals: [], categoryTitle: "hi")
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "Meals",
      //     style: Theme.of(context)
      //         .textTheme
      //         .titleMedium!
      //         .copyWith(color: Theme.of(context).primaryColorDark),
      //   ),
      // ),
      body: pages[_currentIndex],
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
