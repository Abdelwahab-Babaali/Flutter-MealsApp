import 'package:flutter_new_mealapp/data/dummy_data%20(1).dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
