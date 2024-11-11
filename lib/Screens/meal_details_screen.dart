import 'package:flutter/material.dart';
import 'package:meal/Models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  MealDetailScreen(
      {super.key, required this.meal, required this.onToogleFavorite});
  final Meal meal;
  final void Function(Meal meal) onToogleFavorite;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
        actions: [
          IconButton(
              onPressed: () {
                onToogleFavorite(meal);
              },
              icon: const Icon(
                Icons.favorite,
                size: 20,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 6,
              child: Image.network(
                meal.imageUrl,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "Ingridents",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            for (final ingrident in meal.ingredients)
              Text(
                ingrident,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white),
              ),
            const SizedBox(
              height: 6,
            ),
            Text(
              "Steps",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            for (final step in meal.steps)
              Text(step,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white)),
            const SizedBox(
              height: 6,
            )
          ],
        ),
      ),
    );
  }
}
