import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_max2/module/meal.dart';
import 'package:flutter_app_max2/screens/catogrie_screen.dart';
import 'package:flutter_app_max2/screens/far_screen.dart';
import 'package:flutter_app_max2/widget/drawer_content.dart';

class TabsScreen extends StatefulWidget {
  final Function isFavorite;
  final Function handle;
  final List<Meal> favoriteMeals;

  TabsScreen({this.isFavorite, this.handle, this.favoriteMeals});
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> pages;

  int selectedPage = 0;

  _chosenPage(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  @override
  void initState() {
    pages = [
      {
        'page': CatogrieScreen(),
        'title': Text('your Category'),
      },
      {
        'page': FavScrren(
          isFavorite: widget.isFavorite,
          favoriteMeals: widget.favoriteMeals,
          handle: widget.handle,
        ),
        'title': Text('your favorite'),
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: pages[selectedPage]['title'],
      ),
      drawer: DrawerScreen(),
      body: pages[selectedPage]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedPage,
        onTap: _chosenPage,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text('category')),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              title: Text('favorite')),
        ],
      ),
    );
  }
}
