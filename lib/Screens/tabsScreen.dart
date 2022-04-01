import 'package:flutter/material.dart';
import './categoriesScreen.dart';
import './favoritesScreen.dart';
import './mainDrawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  TabsScreenState createState() => TabsScreenState();
}

class TabsScreenState extends State<TabsScreen> {
  int currIndex = 0;

  void setPageIndex(index) {
    setState(() {
      currIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> pages = [
      {
        'screen': CategoryScreen(),
        'title': 'Categories',
      },
      {
        'screen': FavoritesScreen(),
        'title': 'your Favorites',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(pages[currIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: pages[currIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Theme.of(context).accentColor,
        fixedColor: Theme.of(context).primaryColor,
        selectedFontSize: 14.5,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        selectedIconTheme: const IconThemeData(size: 26),
        unselectedIconTheme: const IconThemeData(size: 21),
        elevation: 9,
        currentIndex: currIndex,
        onTap: setPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          )
        ],
      ),
    );
  }
}
