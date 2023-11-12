import 'package:flutter/material.dart';
import 'package:task/util/constants.dart';
import 'package:task/widgets/meal_item.dart';

import '../models/meal.dart';

class CategoriesMealsScreen extends StatefulWidget {
  final List<Meal> availableMeals;
  static const String routeName = 'categories_meals';

  const CategoriesMealsScreen({
    Key? key,
    required this.availableMeals,
  }) : super(key: key);

  @override
  State<CategoriesMealsScreen> createState() => _CategoriesMealsScreenState();
}

class _CategoriesMealsScreenState extends State<CategoriesMealsScreen> {
  late String categoryTitle;
  late List<Meal> categoryMeals;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final routeArgs =
    ModalRoute
        .of(context)
        ?.settings
        .arguments as Map<String, String>;
    final categoryId = routeArgs[navArgId].toString();
    categoryTitle = routeArgs[navArgTitle].toString();
    categoryMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final meal = categoryMeals[index];
          return MealItem(
            id: meal.id,
            title: meal.title,
            imageUrl: meal.imageUrl,
            affordability: meal.affordability,
            complexity: meal.complexity,
            duration: meal.duration,
            removeItem: null,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
