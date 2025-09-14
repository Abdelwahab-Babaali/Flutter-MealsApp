//import 'package:flutter/foundation.dart';//
import 'package:flutter/material.dart';

import 'package:flutter_new_mealapp/screens/meals_screen.dart';

import '../models/category.dart';
import '../models/meal.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.availableMeals,
  });

  final Category category;

  final List<Meal> availableMeals;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      //GestureDetector
      onTap: () {
        final List<Meal> filteredMeal = availableMeals
            .where(
              (meal) => meal.categories.contains(category.id),
            )
            .toList();

        Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => MealsScreen(
            title: category.title,
            meal: filteredMeal,
          ),
        ));
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.55),
                category.color.withOpacity(0.10),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          )),
    );
  }
}
