import 'package:flutter/material.dart';
import 'package:task/models/meal.dart';
import 'package:task/screens/categories_screen.dart';
import 'package:task/screens/favorites_screen.dart';
import 'package:task/widgets/main_drawer.dart';

import '../util/constants.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/';
  final List<Meal> favoriteMeals;

  const TabsScreen({Key? key, required this.favoriteMeals}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      {
        page: const CategoriesScreen(),
        title: categories,
      },
      {
        page: FavoritesScreen(favoriteMeals: widget.favoriteMeals),
        title: yourFavoritesText,
      }
    ];
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var selectedPage = _pages[_selectedPageIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPage[title].toString()),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.category),
            label: categories,
            // Add separate backgroundColor for BottomNavigationBarItem
            // if type: BottomNavigationBarType.shifting
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.star),
            label: favorite,
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
      body: selectedPage[page] as Widget,
      drawer: const MainDrawer(),
    );
  }
}
