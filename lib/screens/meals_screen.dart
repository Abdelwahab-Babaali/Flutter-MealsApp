import 'package:flutter/material.dart';
import 'package:flutter_new_mealapp/screens/meal_detail_screen.dart';
import 'package:flutter_new_mealapp/widgets/meal_item.dart';

import '../models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meal,
  });

  final String? title;
  final List<Meal> meal;

  @override
  Widget build(BuildContext context) {
    return title == null
        ? contennt(context)
        : Scaffold(
            appBar: AppBar(
              title: Text(title!),
            ),
            body: contennt(context),
          );
  }

  SingleChildScrollView contennt(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: meal
            .map((meal) => MealItem(
                meal: meal,
                onSelectMeal: (Meal meal) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => MealDetailScreen(
                        meal: meal,
                      ),
                    ),
                  );
                }))
            .toList(),
      ),
    );
  }
}
