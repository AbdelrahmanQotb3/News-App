import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:news_app/ui/screens/home/tabs/category/categories_tab.dart';
import 'package:news_app/ui/screens/home/tabs/home.dart';
import 'package:news_app/ui/screens/home/tabs/news/TabsDetails/tabs_details.dart';
import 'package:news_app/ui/screens/home/tabs/news/TabsList/tabs_list.dart';
import 'package:news_app/ui/screens/home/tabs/settings/settings_tab.dart';
import 'package:firebase_core/firebase_core.dart';
import 'di.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.disableNetwork();
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

