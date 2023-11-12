import 'package:flutter/material.dart';

// GridView dimensions
const gridViewPaddingAll = EdgeInsets.all(25);
const gridViewDelegate = SliverGridDelegateWithMaxCrossAxisExtent(
  maxCrossAxisExtent: 200,
  childAspectRatio: 1.5,
  crossAxisSpacing: 20,
  mainAxisSpacing: 20,
);

// FilterScreen
const filterScreenContainerPadding = EdgeInsets.all(10);

// MealDetail screen
const popDelay = 2;
const sectionTitleMargin = EdgeInsets.symmetric(vertical: 10);
var mealDetailContainerBorderRadius = BorderRadius.circular(10);
const mealDetailContainerMargin = EdgeInsets.all(10);
const mealDetailContainerPadding = EdgeInsets.all(10);
const mealDetailIngredientCardPadding = EdgeInsets.symmetric(
  vertical: 5,
  horizontal: 10,
);

// CategoryItem
var categoryItemBorderRadius = BorderRadius.circular(15);
const categoryItemPadding = EdgeInsets.all(15);

// MainDrawer
const mainDrawerContainerPadding = EdgeInsets.all(20);
const double mainDrawerContainerHeight = 120;
const double mainDrawerSizedBoxHeight = 20;
const double mainDrawerListTitleFontSize = 20;
const double mainDrawerContainerTextSize = 30;
const double mainDrawerListTitleIconSize = 26;

// MealItem
var mealItemCardBorderRadius = BorderRadius.circular(15);
const double mealItemCardElevation = 5;
const mealItemCardMargin = EdgeInsets.all(10);
var mealItemClipRRectBorderRadius = const BorderRadius.only(
  topLeft: Radius.circular(15),
  topRight: Radius.circular(15),
);
const double mealItemImageHeight = 250;
const double mealItemBottomPositioned = 20;
const double mealItemRightPositioned = 10;
const double mealItemPositionedContainerWidth = 300;
const mealItemPositionedContainerPadding = EdgeInsets.symmetric(
  vertical: 5,
  horizontal: 20,
);
const mealItemPaddingWidgetPadding = EdgeInsets.all(20);
const double mealItemBuildRowSizedBoxWidth = 6;
const double mealItemPositionedTextSize = 26;

const double textThemeFontSize = 20;
