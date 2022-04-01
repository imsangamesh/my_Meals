// import 'dart:js';

import 'package:flutter/material.dart';
import '../widgets/categoryItem.dart';
import '../data/dummy_data.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Meals'),
      // ),
      body: GridView(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES
            .map((cat) => CategoryItem(cat.title, cat.color, cat.id))
            .toList(),
      ),
    );
  }
}
