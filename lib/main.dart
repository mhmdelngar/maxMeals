import 'package:flutter/material.dart';
import 'package:flutter_app_max2/dummy_data.dart';
import 'package:flutter_app_max2/screens/TabsScreen.dart';
import 'package:flutter_app_max2/screens/filter_screen.dart';
import 'package:flutter_app_max2/screens/meal_detail_screen.dart';

import 'file:///C:/Users/hp/AndroidStudioProjects/flutter_app_max2/lib/screens/catogrie_recipe.dart';

import 'module/meal.dart';

enum Affordability { Affordable, Pricey, Luxurious }
enum Complexity { Simple, Challenging, Hard }

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> dummyFilterd = DUMMY_MEALS;

  Map<String, Object> _filterd = {
    'isGlutenFree': false,
    'isVegan': false,
    'isVegetarian': false,
    'isLactoseFree': false
  };

  setFilter(Map<String, Object> filterdData) {
    setState(() {
      _filterd = filterdData;

      dummyFilterd = DUMMY_MEALS.where((element) {
        if (_filterd['isGlutenFree'] && !element.isGlutenFree) {
          return false;
        }
        if (_filterd['isVegan'] && !element.isVegan) {
          return false;
        }
        if (_filterd['isVegetarian'] && !element.isVegetarian) {
          return false;
        }
        if (_filterd['isLactoseFree'] && !element.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();

      //
    });
  }

  List<Meal> favoriteMeals = [];

  handleFavorite(String mealId) {
    final exiectingIndex =
        favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (exiectingIndex >= 0) {
      setState(() {
        favoriteMeals.removeAt(exiectingIndex);
      });
    } else {
      setState(() {
        print('added');
        favoriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
        print(favoriteMeals[0]);
      });
    }
  }

  isFavorite(String id) {
    return favoriteMeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              caption: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold))),
      routes: {
        '/': (context) => TabsScreen(
              isFavorite: isFavorite,
              favoriteMeals: favoriteMeals,
              handle: handleFavorite,
            ),
        CatogrieRecipe.nameOftheScreen: (context) => CatogrieRecipe(
              DummyFilterd: dummyFilterd,
            ),
        MealDetailScreen.nameOftheScreen: (context) => MealDetailScreen(
              isFavorite: isFavorite,
              handle: handleFavorite,
            ),
        FiltersScreen.nameOftheScreen: (context) => FiltersScreen(
              updateFilter: setFilter,
              filtered: _filterd,
            ),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Max'),
      ),
      body: Center(
        child: Text('navigation time'),
      ),
    );
  }
}
