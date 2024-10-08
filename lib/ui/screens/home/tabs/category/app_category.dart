import 'package:flutter/material.dart';
import 'package:news_app/model/categories.dart';

class AppCategory extends StatelessWidget {
  final Categories categories;

  AppCategory({super.key, required this.categories});

  final radius = Radius.circular(24);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: categories.backgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: radius,
              topRight: radius,
              bottomLeft: categories.isLeftSided ? Radius.zero : radius,
              bottomRight: !categories.isLeftSided ? Radius.zero : radius)),
      child: Column(
        children: [
          Expanded(
              child: Image.asset(
            categories.imagePath,
            height: MediaQuery.of(context).size.height * .3,
          )),
          Text(
            categories.title,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
