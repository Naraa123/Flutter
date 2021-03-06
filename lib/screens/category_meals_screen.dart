import 'package:first_app/dummy_data.dart';
import 'package:first_app/models/category.dart';
import 'package:first_app/models/meal.dart';
import 'package:first_app/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routName = '/category-meals';
  //final String categoryID;
  //final String categoryTitle;
  //CategoryMealsScreen(this.categoryID, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability,
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
