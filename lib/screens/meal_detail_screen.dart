import 'dart:async';

import 'package:flutter/material.dart';
import 'package:task/util/constants.dart';
import 'package:task/util/dimens.dart';

import '../data/dummy_meals.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = 'meals_details';
  final Function toggleFavorite;
  final Function isFavorite;

  const MealDetailsScreen(
      {Key? key, required this.toggleFavorite, required this.isFavorite})
      : super(key: key);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: sectionTitleMargin,
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget buildContainer(MediaQueryData mediaQuery, Widget child) {
    return Container(
      height: mediaQuery.size.height * 0.3,
      width: mediaQuery.size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: mealDetailContainerBorderRadius,
      ),
      margin: mealDetailContainerMargin,
      padding: mealDetailContainerPadding,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = dummyMeals.firstWhere((meal) => meal.id == mealId);
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: selectedMeal.imageUrl,
              child: SizedBox(
                height: mediaQuery.size.height * 0.4,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            buildSectionTitle(context, ingredients),
            buildContainer(
              mediaQuery,
              ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                      padding: mealDetailIngredientCardPadding,
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, steps),
            buildContainer(
                mediaQuery,
                ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            child: Text("# ${index + 1}"),
                          ),
                          title: Text(selectedMeal.steps[index]),
                        ),
                        const Divider()
                      ],
                    );
                  },
                  itemCount: selectedMeal.steps.length,
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          toggleFavorite(mealId);
          Timer(const Duration(seconds: popDelay), () {
            Navigator.of(context).pop(mealId);
          });
        },
        child: Icon(isFavorite(mealId) ? Icons.star : Icons.star_border),
      ),
    );
  }
}
