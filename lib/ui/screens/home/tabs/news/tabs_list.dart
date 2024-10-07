import 'package:flutter/material.dart';
import 'package:news_app/Data/api_manager.dart';
import 'package:news_app/ui/comman%20widgets/app_error.dart';
import 'package:news_app/ui/comman%20widgets/app_loader.dart';

import '../../../../../model/sourcesResponse.dart';

class TabsList extends StatefulWidget {
  static String routeName = "TabsList";

  const TabsList({super.key});

  @override
  State<TabsList> createState() => _TabsListState();
}

class _TabsListState extends State<TabsList> {
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: APIManager.loadTabsList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return appError(error: snapshot.error.toString());
          } else if (snapshot.hasData) {
            return tabsList(snapshot.data!.sources!);
          } else {
            return appLoader();
          }
        });
  }

  Widget tabsList(List<Sources> sources) {
    // List<Widget> tabsWidgetList = [];
    // for (var source in sources) {
    //   tabsWidgetList.add(tabWidget(source, true));
    // }
    return DefaultTabController(
      length: sources.length,
      child: Column(
        children: [
          TabBar(
            tabs: sources
                .map((source) => tabWidget(
                    source, currentTabIndex == sources.indexOf(source)))
                .toList(),
            isScrollable: true,
            indicatorColor: Colors.transparent,
            onTap: (newTabIndex) {
              setState(() {
                currentTabIndex = newTabIndex;
              });
            },
            // this statment is another way for converting the list<sources> to list of widgets by giving this function one example and it creates all of them the same
          ),
          Expanded(
            child: TabBarView(
              children: sources.map((source) {
                return Text(source.description ?? "");
              }).toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget tabWidget(Sources source, bool isSelected) {
    return Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xff39A552)),
            borderRadius: BorderRadius.circular(20),
            color: isSelected ? Color(0xff39A552) : Colors.white),
        child: Text(
          source.name ?? "Unknown Source",
          style:
              TextStyle(color: isSelected ? Colors.white : Color(0xff39A552)),
        ));
  }
}
