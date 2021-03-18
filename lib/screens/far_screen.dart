import 'package:flutter/material.dart';
import 'package:flutter_app_max2/module/meal.dart';
import 'package:flutter_app_max2/widget/meals_item.dart';

class FavScrren extends StatelessWidget {
  final Function isFavorite;
  final Function handle;
  final List<Meal> favoriteMeals;

  FavScrren({this.isFavorite, this.handle, this.favoriteMeals});

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty
        ? Center(
            child: Text('no Favorite added add some'),
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              // Affordability affordability = mealsId[index].affordability;
              // Complexity complexity = mealsId[index].complexity;

              return MealsItem(
                id: favoriteMeals[index].id,
                title: favoriteMeals[index].title,
                imageurl: favoriteMeals[index].imageUrl,
                duration: favoriteMeals[index].duration,
              );
            },
            itemCount: favoriteMeals.length,
          );
  }
}
