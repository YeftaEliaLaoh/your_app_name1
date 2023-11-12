import 'package:flutter/material.dart';
import 'package:task/util/constants.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const FavoritesScreen({Key? key, required this.favoriteMeals})
      : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  void _removeMeal(String id) {
    setState(() {
      widget.favoriteMeals.removeWhere((meal) => meal.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.favoriteMeals.isEmpty) {
      return const Center(
        child: Text(noFavoriteMessage),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          final meal = widget.favoriteMeals[index];
          return MealItem(
            id: meal.id,
            title: meal.title,
            imageUrl: meal.imageUrl,
            affordability: meal.affordability,
            complexity: meal.complexity,
            duration: meal.duration,
            removeItem: _removeMeal,
          );
        },
        itemCount: widget.favoriteMeals.length,
      );
    }
  }
}
