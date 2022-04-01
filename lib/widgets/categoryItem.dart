import 'package:flutter/material.dart';

import '../Screens/categoryMealsScreen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  const CategoryItem(this.title, this.color, this.id);
  @override
  Widget build(BuildContext context) {
    void selectCategory(context) {
      Navigator.of(context).pushNamed(
        // MaterialPageRoute(builder: (_) => CategoryMeals(id, title)),
        CategoryMealsScreen.routeName,
        arguments: {
          'id': id,
          'title': title,
        },
      );
    }

    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromRGBO(255, 102, 165, 1),
            width: 3,
          ),
          color: color,
          gradient: LinearGradient(
            colors: [color.withOpacity(0.5), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
