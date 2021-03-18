import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_max2/screens/meal_detail_screen.dart';

import '../main.dart';

class MealsItem extends StatelessWidget {
  final String title;
  final String id;
  final String imageurl;
  final int duration;
  final Affordability affordability;
  final Complexity complexity;
  final Function onDelete;

  MealsItem(
      {this.imageurl,
      this.affordability,
      this.complexity,
      this.title,
      this.duration,
      this.id,
      this.onDelete});

  String get theComplex {
    switch (complexity) {
      case Complexity.Hard:
        return 'hard';
        break;
      case Complexity.Hard:
        return 'simple';
        break;
      case Complexity.Hard:
        return 'challanging';
        break;
      default:
        return 'unkown';
        break;
    }
  }

  goToMoreDetails(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(MealDetailScreen.nameOftheScreen, arguments: id)
        .then((value) {
      if (value != null) {
        onDelete(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => goToMoreDetails(context),
      child: Card(
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageurl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 170,
                  left: 50,
                  child: Container(
                    width: MediaQuery.of(context).size.width - 40,
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: TextStyle(color: Colors.white, fontSize: 17),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.access_alarms),
                      Text(
                        '$duration min',
                        style: TextStyle(fontSize: 17),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.shop),
                      Text('pricy', style: TextStyle(fontSize: 17))
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.compare_arrows),
                      Text(theComplex, style: TextStyle(fontSize: 17))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
