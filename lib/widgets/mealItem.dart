import 'package:flutter/material.dart';

import '../Screens/mealDetailsScreen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  MealItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  });

  String get affordabilityName {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Expensive';
      default:
        return 'Unknown';
    }
  }

  String get complxityName {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  Widget buildMealIcon(BuildContext context, IconData icon, String text) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 5),
        Text(
          text,
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ],
    );
  }

  void selectMeal(context) {
    Navigator.of(context).pushNamed(MealDetailsScreen.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: InkWell(
        splashColor: Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(15),
        onTap: () => selectMeal(context),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black54,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    bottom: 15,
                    right: 15,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildMealIcon(
                      context,
                      Icons.schedule,
                      '$duration min',
                    ),
                    buildMealIcon(
                      context,
                      Icons.work,
                      affordabilityName,
                    ),
                    buildMealIcon(
                      context,
                      Icons.attach_money,
                      complxityName,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
