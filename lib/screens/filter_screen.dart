import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_max2/widget/drawer_content.dart';

class FiltersScreen extends StatefulWidget {
  static const String nameOftheScreen = '/FiltersScreen';
  final Function updateFilter;
  final Map<String, Object> filtered;
  const FiltersScreen({Key key, this.updateFilter, this.filtered})
      : super(key: key);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;

  bool isVegan = false;

  bool isVegetarian = false;

  bool isLactoseFree = false;

  @override
  void initState() {
    _isGlutenFree = widget.filtered['isGlutenFree'];

    isVegan = widget.filtered['isVegan'];

    isVegetarian = widget.filtered['isVegetarian'];

    isLactoseFree = widget.filtered['isLactoseFree'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget buildSwitch({bool value, String title, Function onchanged}) {
      return SwitchListTile(
          value: value,
          title: Text(
            title,
            style: TextStyle(fontSize: 17, color: Colors.black),
          ),
          onChanged: onchanged);
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('ad'),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  "isGlutenFree": _isGlutenFree,
                  'isVegan': isVegan,
                  'isVegetarian': isVegetarian,
                  'isLactoseFree': isLactoseFree
                };
                widget.updateFilter(selectedFilters);
              },
            )
          ],
        ),
        drawer: DrawerScreen(),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 150,
              width: double.infinity,
              child: Text(
                'Adjust you meal selection',
                style: Theme.of(context)
                    .textTheme
                    .caption, // TextStyle(fontSize: 18,fontFamily: ''),
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                buildSwitch(
                    value: isVegan,
                    title: 'isVegan',
                    onchanged: (value) {
                      setState(() {
                        isVegan = value;
                      });
                    }),
                buildSwitch(
                    value: _isGlutenFree,
                    title: 'isGlutenFree',
                    onchanged: (value) {
                      setState(() {
                        _isGlutenFree = value;
                      });
                    }),
                buildSwitch(
                    value: isLactoseFree,
                    title: 'isLactoseFree',
                    onchanged: (value) {
                      setState(() {
                        isLactoseFree = value;
                      });
                    }),
                buildSwitch(
                    value: isVegetarian,
                    title: 'isVegetarian',
                    onchanged: (value) {
                      setState(() {
                        print(value);
                        isVegetarian = value;
                      });
                    }),
              ],
            ))
          ],
        ));
  }
}
