//import 'package:flutter/material.dart';//
import 'package:flutter_new_mealapp/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final isExisting = state.contains(meal);
    if (isExisting) {
      // state.remove(meal);
      state = state.where((element) => element.id != meal.id).toList();
      return false;
    } else {
      // [...[1, 2, 3], 4] => [1,2,3,4] ;//
      //  state.add(meal);
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});
