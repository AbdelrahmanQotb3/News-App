import 'package:flutter/material.dart';
import 'package:news_app/model/categories.dart';

import 'app_category.dart';

class CategoriesTab extends StatelessWidget {
  static String routeName = "CategoriesTab";
  const CategoriesTab ({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Pick your category of interests ." , style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14
        ),),
        Expanded(
          child: GridView.builder(
              itemCount: Categories.categories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context , index){
                return AppCategory(categories: Categories.categories[index]);
              }
          ),
        )
      ],
    );
  }
}
