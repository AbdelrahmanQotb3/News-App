import 'package:flutter/material.dart';
import 'package:news_app/model/categories.dart';
import 'package:news_app/ui/screens/home/tabs/category/categories_tab.dart';
import 'package:news_app/ui/screens/home/tabs/news/tabs_list.dart';

class Home extends StatefulWidget {
  static String routeName = "Home";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Categories? category ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("News App" , style: TextStyle(fontSize: 20 , color: Colors.white ),),
        backgroundColor: Color(0xff39A552),
      ),
      body: category == null ?CategoriesTab(onCategoryClick: onCategoryClick) : TabsList(categoryID: category!.backendId,),
    );
  }

  void onCategoryClick(Categories category){
    setState(() {
      this.category = category;
    });

  }
}
