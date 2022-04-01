import 'package:flutter/material.dart';

import './Screens/categoryMealsScreen.dart';
import './Screens/mealDetailsScreen.dart';
import './Screens/tabsScreen.dart';
import './Screens/categoriesScreen.dart';
import 'Screens/filters.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.pink,
      //   accentColor: Colors.amber,
      // ),
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
                fontSize: 18.5,
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
                fontSize: 15,
              ),
              subtitle1: const TextStyle(
                fontSize: 23,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
              ),
              subtitle2: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      routes: {
        '/': (context) => TabsScreen(), // home: CategoryScreen(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
        MealDetailsScreen.routeName: (context) => MealDetailsScreen(),
        FiltersScreen.routeName: (context) => FiltersScreen(),
      },
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (context) => CategoryScreen()),
    );
  }
}
