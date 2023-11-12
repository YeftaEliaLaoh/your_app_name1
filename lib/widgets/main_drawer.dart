import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/util/constants.dart';
import 'package:meals_app/util/dimens.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildDrawerList(
    IconData? icon,
    String title,
    Function() onTap,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        size: mainDrawerListTitleIconSize,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: robotoCondensed,
          fontSize: mainDrawerListTitleFontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: mainDrawerContainerHeight,
            width: double.infinity,
            padding: mainDrawerContainerPadding,
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary,
            child: Text(
              cookingUp,
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: mainDrawerContainerTextSize,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ),
          const SizedBox(height: mainDrawerSizedBoxHeight),
          buildDrawerList(Icons.restaurant, meals, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildDrawerList(Icons.settings, filter, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          })
        ],
      ),
    );
  }
}
