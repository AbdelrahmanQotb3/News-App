import 'package:flutter/material.dart';
import 'package:news_app/ui/screens/home/tabs/category/categories_tab.dart';
import 'package:news_app/ui/screens/home/tabs/home.dart';
import 'package:news_app/ui/screens/home/tabs/news/tabs_details.dart';
import 'package:news_app/ui/screens/home/tabs/news/tabs_list.dart';
import 'package:news_app/ui/screens/home/tabs/settings/settings_tab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Home.routeName : (_) => Home(),
        SettingsTab.routeName : (_) => SettingsTab(),

      },
      initialRoute: Home.routeName,

    );
  }
}

