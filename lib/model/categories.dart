import 'package:flutter/material.dart';

class Categories{
  String backendId ;
  String title;
  String imagePath;
  bool isLeftSided;
  Color backgroundColor;

  Categories({
    required this.backendId,
    required this.title,
    required this.imagePath,
    required this.isLeftSided,
    required this.backgroundColor
});

  static List<Categories> categories = [
    Categories(
        backendId: "sports",
        title: "Sports",
        imagePath: "assets/ball.png",
        isLeftSided: true,
        backgroundColor: Colors.red),
    Categories(
        backendId: "technology",
        title: "Technology",
        imagePath: "assets/Politics.png",
        isLeftSided: false,
        backgroundColor: Colors.blue[900]!),
    Categories(
        backendId: "health",
        title: "Health",
        imagePath: "assets/health.png",
        isLeftSided: true,
        backgroundColor: Colors.pink),
    Categories(
        backendId: "business",
        title: "Business",
        imagePath: "assets/bussines.png",
        isLeftSided: false,
        backgroundColor: Colors.brown),
    Categories(
        backendId: "entertainment",
        title: "Entertainment",
        imagePath: "assets/environment.png",
        isLeftSided: true,
        backgroundColor: Colors.blueAccent),
    Categories(
        backendId: "science",
        title: "Science",
        imagePath: "assets/science.png",
        isLeftSided: false,
        backgroundColor: Colors.yellow)
  ];
}