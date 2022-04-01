import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

import '../data/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const String routeName = '/Meal-Details';
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    Widget buildCard(context, String title, IconData icon, Widget child) {
      return Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(width: 7),
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
        Container(
          height: 160,
          width: 300,
          padding: const EdgeInsets.symmetric(vertical: 3.5, horizontal: 2),
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Theme.of(context).accentColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: child,
        )
      ]);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 0, top: 0, left: 0, bottom: 10),
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 30),
              buildCard(
                context,
                'Ingredients',
                Icons.fastfood,
                ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (context, index) => Card(
                    elevation: 5,
                    color: Theme.of(context).accentColor.withAlpha(150),
                    child: Padding(
                      padding: const EdgeInsets.all(3.5),
                      child: Text(
                        selectedMeal.ingredients[index],
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              buildCard(
                context,
                'Steps',
                Icons.restaurant_rounded,
                ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                        ),
                        title: Text(
                          selectedMeal.steps[index],
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      Divider(
                        color: Theme.of(context).accentColor,
                        thickness: 2,
                        endIndent: 10,
                        indent: 10,
                        height: 4,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
