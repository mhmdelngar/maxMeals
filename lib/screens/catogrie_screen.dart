import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widget/catogrie_item.dart';

class CatogrieScreen extends StatelessWidget {
  static const String nameOftheScreen = '/';

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      children: DUMMY_CATEGORIES
          .map((cat) => CatogtyItem(
                id: cat.id,
                title: cat.title,
                color: cat.color,
              ))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
