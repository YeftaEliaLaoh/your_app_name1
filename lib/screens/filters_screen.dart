import 'package:flutter/material.dart';
import 'package:task/util/constants.dart';
import 'package:task/util/dimens.dart';
import 'package:task/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = 'filter_screen';
  final Function saveFilters;
  final Map<String, bool> filters;

  const FiltersScreen({
    Key? key,
    required this.saveFilters,
    required this.filters,
  }) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    super.initState();
    _glutenFree = widget.filters[gluten]!;
    _vegetarian = widget.filters[vegetarian]!;
    _vegan = widget.filters[vegan]!;
    _lactoseFree = widget.filters[lactose]!;
  }

  SwitchListTile buildSwitchListTile(
    String title,
    String subtitle,
    bool currentValue,
    Function(bool) updatedValue,
  ) {
    return SwitchListTile(
      activeColor: Theme.of(context).colorScheme.secondary,
      value: currentValue,
      onChanged: updatedValue,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(yourFiltersText),
        actions: [
          IconButton(
            onPressed: () {
              final filters = {
                gluten: _glutenFree,
                lactose: _lactoseFree,
                vegan: _vegan,
                vegetarian: _vegetarian,
              };
              widget.saveFilters(filters);
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: filterScreenContainerPadding,
            child: Text(
              adjustMealSelectionText,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  glutenFree,
                  glutenFreeDesc,
                  _glutenFree,
                  (isGlutenFree) {
                    setState(() => _glutenFree = isGlutenFree);
                  },
                ),
                buildSwitchListTile(
                  lactose,
                  lactoseFree,
                  _lactoseFree,
                  (isLactoseFree) {
                    setState(() => _lactoseFree = isLactoseFree);
                  },
                ),
                buildSwitchListTile(
                  vegetarian,
                  vegetarianDesc,
                  _vegetarian,
                  (isVegetarian) {
                    setState(() => _vegetarian = isVegetarian);
                  },
                ),
                buildSwitchListTile(
                  vegan,
                  veganDesc,
                  _vegan,
                  (isVegan) {
                    setState(() => _vegan = isVegan);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
