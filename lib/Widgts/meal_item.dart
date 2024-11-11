import 'package:flutter/widgets.dart';
import 'package:meal/Models/meal.dart';
import "package:flutter/material.dart";
import "package:meal/Widgts/meal_specification_info.dart";
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  MealItem(
      {super.key,
      required this.filteredmeal,
      required this.selectingMealDetail});
  final Meal filteredmeal;
  final void Function(BuildContext context, Meal filteredmeal)
      selectingMealDetail;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          selectingMealDetail(context, filteredmeal);
        },
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(filteredmeal.imageUrl),
                fadeInDuration: Duration(seconds: 2),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: const Color.fromRGBO(0, 0, 0, 0.541),
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      filteredmeal.title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(children: [
                          const Icon(
                            Icons.schedule,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${filteredmeal.duration} min',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ]),
                        const SizedBox(
                          width: 10,
                        ),
                        MealSpecificationInfo(
                            icon: Icons.work,
                            info: filteredmeal.complexity.name),
                        const SizedBox(
                          width: 10,
                        ),
                        MealSpecificationInfo(
                            icon: Icons.price_change,
                            info: filteredmeal.affordability.name),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
