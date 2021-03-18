import 'package:flutter/material.dart';
import 'package:flutter_app_max2/dummy_data.dart';
import 'package:flutter_app_max2/module/meal.dart';

class MealDetailScreen extends StatefulWidget {
  Function isFavorite;
  Function handle;
  static const String nameOftheScreen = '/MealDetailScreen';

  MealDetailScreen({this.isFavorite, this.handle});

  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context).settings.arguments;
    var selectedMeal = DUMMY_MEALS.firstWhere((element) => element.id == id);
    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            MealTitle(
              title: 'Ingredients',
            ),
            Steps_andingredients(
              selectedMeal: selectedMeal,
              insideThecontainer: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.amber,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        selectedMeal.ingredients[index],
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            MealTitle(
              title: 'Steps',
            ),
            Steps_andingredients(
              selectedMeal: selectedMeal,
              insideThecontainer: ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            selectedMeal.steps[index],
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                        ),
                      ),
                      Container(
                        width: 200,
                        child: Divider(
                          thickness: 2,
                          height: 2,
                        ),
                      )
                    ],
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.handle(id);
        },
        // ignore: unrelated_type_equality_checks
        child: widget.isFavorite(id)
            ? Icon(Icons.favorite)
            : Icon(Icons.favorite_border),
      ),
    );
  }
}

// ignore: camel_case_types
class Steps_andingredients extends StatelessWidget {
  const Steps_andingredients({
    @required this.selectedMeal,
    this.insideThecontainer,
  });

  final Meal selectedMeal;
  final Widget insideThecontainer;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 2, color: Colors.grey),
      ),
      height: 200,
      width: 300,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: insideThecontainer,
    );
  }
}

class MealTitle extends StatelessWidget {
  final String title;

  const MealTitle({this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.caption,
    );
  }
}
