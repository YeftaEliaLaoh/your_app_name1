import 'package:flutter/material.dart';
import 'package:task/data/dummy_categories.dart';
import 'package:task/util/dimens.dart';
import 'package:task/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routeName = "/";

  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: gridViewPaddingAll,
      gridDelegate: gridViewDelegate,
      children: dummyCategories
          .map((category) => CategoryItem(
                category.id,
                category.title,
                category.color,
              ))
          .toList(),
    );
  }
}
