import 'package:flutter/material.dart';
import "package:todo/data/ItemData.dart";
import "package:todo/models/Items.dart";
import "package:todo/widget/detaile_page.dart";
import "package:todo/widget/itemCard.dart";

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  List<Item> items = itemsData
      .map(
        (data) => Item(
          title: data["title"],
          description: data["description"],
          isFavorite: data["isFavorite"],
        ),
      )
      .toList();

  void _toogleFavorite(int index) {
    setState(() {
      items[index] =
          items[index].copyWith(isFavorite: !items[index].isFavorite);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ItemCard(
              item: items[index],
              onToggleFavorite: () => _toogleFavorite(index),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (coontext) => DetailePage(item: items[index])),
                );
              },
            );
          }),
    );
  }
}
