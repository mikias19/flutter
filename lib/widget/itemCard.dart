import 'package:flutter/material.dart';
import "package:todo/models/Items.dart";

class ItemCard extends StatelessWidget {
  final Item item;
  final void Function() onToggleFavorite;
  final void Function() onTap;
  const ItemCard(
      {super.key,
      required this.item,
      required this.onToggleFavorite,
      required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        onTap: onTap,
        title: Text(item.title),
        subtitle: Text(item.description),
        trailing: IconButton(
          onPressed: onToggleFavorite,
          icon: Icon(item.isFavorite ? Icons.favorite : Icons.favorite_border),
          color: item.isFavorite ? Colors.red : Colors.grey,
        ),
      ),
    );
  }
}
