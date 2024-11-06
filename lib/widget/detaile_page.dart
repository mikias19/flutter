import 'package:flutter/material.dart';
import "package:todo/models/Items.dart";

class DetailePage extends StatelessWidget {
  final Item item;
  const DetailePage({super.key, required this.item});
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                item.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                item.description,
                style: const TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                item.isFavorite
                    ? "This is one of your favorite items!"
                    : "This item is not in your favorite.",
                style: TextStyle(
                  fontSize: 16,
                  color: item.isFavorite ? Colors.red : Colors.grey,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
