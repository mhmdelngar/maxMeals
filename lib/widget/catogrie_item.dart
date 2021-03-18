import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'file:///C:/Users/hp/AndroidStudioProjects/flutter_app_max2/lib/screens/catogrie_recipe.dart';

class CatogtyItem extends StatelessWidget {
  final Color color;
  final String title;
  final String id;

  const CatogtyItem({this.color, this.title, this.id});
  navigteTorecipe(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CatogrieRecipe.nameOftheScreen,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigteTorecipe(context),
      child: Container(
        child: Text(
          title,
          style: Theme.of(context).textTheme.caption,
        ),
        padding: const EdgeInsets.all(15.00),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15.00),
        ),
      ),
    );
  }
}
