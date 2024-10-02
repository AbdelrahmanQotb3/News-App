import 'package:flutter/material.dart';
import 'package:news_app/ui/screens/home/tabs/home.dart';
import 'package:news_app/ui/screens/home/tabs/news/tabs_details.dart';
import 'package:news_app/ui/screens/home/tabs/news/tabs_list.dart';
import 'package:news_app/ui/screens/home/tabs/settings/settings.dart';

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
        TabsList.routeName : (_) => TabsList(),
        TabsDetails.routeName : (_) => TabsDetails(),
        Settings.routeName : (_) => Settings()
      },
      initialRoute: Home.routeName,

    );
  }
}

