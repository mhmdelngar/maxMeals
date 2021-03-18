import 'package:flutter/material.dart';
import 'package:flutter_app_max2/screens/filter_screen.dart';

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget buildListTile(String title, IconData icon, Function onPressed) {
      return ListTile(
        onTap: onPressed,
        leading: Icon(
          icon,
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    }

    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(color: Theme.of(context).accentColor),
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking Up !',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 30,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w900),
            ),
          ),
          buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Filters', Icons.settings, () {
            Navigator.pushReplacementNamed(
                context, FiltersScreen.nameOftheScreen);
          }),
        ],
      ),
    );
  }
}
