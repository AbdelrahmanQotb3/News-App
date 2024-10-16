import 'package:flutter/material.dart';
import 'package:news_app/model/categories.dart';
import 'package:news_app/ui/screens/home/tabs/category/categories_tab.dart';
import 'package:news_app/ui/screens/home/tabs/news/TabsList/tabs_list.dart';
import 'package:news_app/ui/screens/home/tabs/settings/settings_tab.dart';

class Home extends StatefulWidget {
  static String routeName = "Home";

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Widget body;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    body = CategoriesTab(onCategoryClick: onCategoryClick);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async{
          if(body is CategoriesTab ){
            return true;
          }else{
            setState(() {
              body =CategoriesTab(onCategoryClick: onCategoryClick);
            });
            return false;
          }
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "News App",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            backgroundColor: Color(0xff39A552),
          ),
          drawer: buildDrawer(),
          body: body,
        ),
      ),
    );
  }

  Drawer buildDrawer() => Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            Container(
                // margin: EdgeInsets.all(12),
                padding: EdgeInsets.all(32),
                color: Color(0xff39A552),
                width: double.infinity,
                child: Text(
                  "News App",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 26),
                )),
            buildRowListDrawer(Icons.list, "Categories", () {
              setState(() {
                body = CategoriesTab(onCategoryClick: onCategoryClick);
                Navigator.pop(context);
              });
            }),
            buildRowListDrawer(Icons.settings, "Settings", () {
              setState(() {
                body = SettingsTab();
                Navigator.pop(context);
              });
            })
          ],
        ),
      );

  Widget buildRowListDrawer(IconData icon, String title, Function onClick) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
        margin: EdgeInsets.all(8),
        child: Row(
          children: [
            Icon(
              icon,
              size: 40,
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }

  void onCategoryClick(Categories category) {
    setState(() {
      body = TabsList(categoryID: category.backendId);
    });
  }
}
