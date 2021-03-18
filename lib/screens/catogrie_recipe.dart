import 'package:flutter/material.dart';
import 'package:flutter_app_max2/module/meal.dart';
import 'package:flutter_app_max2/widget/meals_item.dart';

class CatogrieRecipe extends StatefulWidget {
  static const String nameOftheScreen = '/CatogrieRecipe';
  final List<Meal> DummyFilterd;

  const CatogrieRecipe({Key key, this.DummyFilterd}) : super(key: key);
  @override
  _CatogrieRecipeState createState() => _CatogrieRecipeState();
}

class _CatogrieRecipeState extends State<CatogrieRecipe> {
  List mealsId;
  String title;
  bool loadedData = false;
  @override
  void didChangeDependencies() {
    if (!loadedData) {
      final lastData =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      title = lastData['title'];
      final id = lastData['id'];
      mealsId = widget.DummyFilterd.where(
          (element) => element.categories.contains(id)).toList();
      loadedData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    deleteItem(String id) {
      setState(() {
        mealsId.removeWhere((element) => element.id == id);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            // Affordability affordability = mealsId[index].affordability;
            // Complexity complexity = mealsId[index].complexity;

            return MealsItem(
              id: mealsId[index].id,
              title: mealsId[index].title,
              imageurl: mealsId[index].imageUrl,
              duration: mealsId[index].duration,
              onDelete: (value) => deleteItem(value),
            );
          },
          itemCount: mealsId.length,
        ),
      ),
    );
  }
}
