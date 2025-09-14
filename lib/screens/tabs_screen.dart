import 'package:flutter/material.dart';
import 'package:flutter_new_mealapp/providers/favorites_provider.dart';
import 'package:flutter_new_mealapp/providers/filters_provider.dart';
//import 'package:flutter_new_mealapp/providers/meals.provider.dart';//
// import 'package:flutter_new_mealapp/data/dummy_data%20(1).dart';//
import 'package:flutter_new_mealapp/screens/categories_screen.dart';
import 'package:flutter_new_mealapp/screens/filters_screen.dart';
import 'package:flutter_new_mealapp/screens/meals_screen.dart';
import 'package:flutter_new_mealapp/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  // void _showInfoMesg(String message) { }

  void _setScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (ctx) => const FiltersScreen()),
      );
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Meal> availableMeals = ref.watch(filteredMealsProvider);

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Pick your category';

    if (_selectedPageIndex == 1) {
      final List<Meal> favoriteMeal = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        meal: favoriteMeal,
      );
      activePageTitle = ' Favories';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          currentIndex: _selectedPageIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favories'),
          ]),
    );
  }
}
