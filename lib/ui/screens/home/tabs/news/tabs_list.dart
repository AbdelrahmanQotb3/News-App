import 'package:flutter/material.dart';
import 'package:news_app/Data/api_manager.dart';

class TabsList extends StatelessWidget {
  static String routeName = "TabsList";
  const TabsList({super.key});

  @override
  Widget build(BuildContext context) {
    APIManager.loadTabsList();
    return const Placeholder();
  }
}
