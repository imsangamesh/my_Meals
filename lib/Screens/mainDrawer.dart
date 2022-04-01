import 'package:flutter/material.dart';

import '../Screens/filters.dart';

class MainDrawer extends StatelessWidget {
  Widget switchBuilder(
    String text,
    BuildContext context,
    IconData icon,
    tapHandler,
  ) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            icon,
            size: 30,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(
            text,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          onTap: tapHandler,
        ),
        Divider(
          color: Theme.of(context).accentColor,
          indent: 11,
          endIndent: 25,
          height: 1,
          thickness: 1.1,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            AppBar(
              title: Text(
                'Cooking Up !',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                  color: Theme.of(context).accentColor,
                ),
              ),
            ),
            const SizedBox(height: 20),
            switchBuilder(
              'Categories',
              context,
              Icons.restaurant,
              () => Navigator.of(context).pushReplacementNamed('/'),
            ),
            switchBuilder(
              'Filters',
              context,
              Icons.settings,
              () => Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.routeName),
            ),
          ],
        ),
      ),
    );
  }
}
