import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/util/dimens.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function? removeItem;

  const MealItem({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.removeItem,
  }) : super(key: key);

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return "Simple";
      case Complexity.challenging:
        return "Challenging";
      case Complexity.hard:
        return 'Hard';
      default:
        return "Unknown";
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.affordable:
        return "Affordable";
      case Affordability.pricey:
        return "Pricey";
      case Affordability.luxurious:
        return "Luxurious";
      default:
        return "Unknown";
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      MealDetailsScreen.routeName,
      arguments: id,
    )
        .then((result) {
      if (result != null && removeItem != null) {
        removeItem!(result);
      }
    });
  }

  Row buildRow(
    String text,
    IconData icon,
  ) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(
          width: mealItemBuildRowSizedBoxWidth,
        ),
        Text(text)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: mealItemCardBorderRadius,
        ),
        elevation: mealItemCardElevation,
        margin: mealItemCardMargin,
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: imageUrl,
                  child: ClipRRect(
                    borderRadius: mealItemClipRRectBorderRadius,
                    child: Image.network(
                      imageUrl,
                      height: mealItemImageHeight,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: mealItemBottomPositioned,
                  right: mealItemRightPositioned,
                  child: Container(
                    width: mealItemPositionedContainerWidth,
                    color: Colors.black54,
                    padding: mealItemPositionedContainerPadding,
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: mealItemPositionedTextSize,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: mealItemPaddingWidgetPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildRow("$duration min", Icons.schedule),
                  buildRow(complexityText, Icons.work),
                  buildRow(affordabilityText, Icons.attach_money),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
