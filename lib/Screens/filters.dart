import 'package:flutter/material.dart';

import '../Screens/mainDrawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String routeName = '/filters';
  bool glutenSwitch = false;
  bool veganSwitch = false;
  bool vegetarianSwitch = false;
  bool lactoseSwitch = false;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Widget switchContainerBuilder(
      bool currValue, String title, String subTitle, updateValue) {
    return SwitchListTile(
      value: currValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(subTitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            child: Text(
              'Filter out as your needs !',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
          Divider(
            color: Theme.of(context).accentColor,
            indent: 25,
            endIndent: 25,
            height: 15,
            thickness: 0.7,
          ),
          switchContainerBuilder(
            widget.glutenSwitch,
            'Gluten free',
            'filters out the gluten content meal-items ',
            (newValue) => setState(() => widget.glutenSwitch = newValue),
          ),
          switchContainerBuilder(
            widget.veganSwitch,
            'Vegan free',
            'filters out the vegan content meal-items ',
            (newValue) => setState(() => widget.veganSwitch = newValue),
          ),
          switchContainerBuilder(
            widget.vegetarianSwitch,
            'only Vegetarian',
            'filters out the non-vegetarian meal-items ',
            (newValue) => setState(() => widget.vegetarianSwitch = newValue),
          ),
          switchContainerBuilder(
            widget.lactoseSwitch,
            'Lactose free',
            'filters out the lactose content meal-items ',
            (newValue) => setState(() => widget.lactoseSwitch = newValue),
          ),
        ],
      ),
    );
  }
}
