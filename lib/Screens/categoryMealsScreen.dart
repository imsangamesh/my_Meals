import 'package:flutter/material.dart';
import 'package:meals/widgets/mealItem.dart';

import '../data/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  @override
  Widget build(BuildContext context) {
    final routeArguements =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArguements['id'];
    final categoryTitle = routeArguements['title'];

    final categoryMeals = DUMMY_MEALS
        .where(
          (meal) => meal.categories.contains(categoryId),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
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
      ),
    );
  }
}
