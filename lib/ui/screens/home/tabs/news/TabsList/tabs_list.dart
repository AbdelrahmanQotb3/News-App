import 'package:flutter/material.dart';
import 'package:news_app/Data/Repos/news_repo/data_sources/remote_data_sources/news_remote_data_source.dart';
import 'package:news_app/ui/comman%20widgets/app_error.dart';
import 'package:news_app/ui/comman%20widgets/app_loader.dart';
import 'package:news_app/ui/screens/home/tabs/news/TabsDetails/tabs_details.dart';
import 'package:news_app/ui/screens/home/tabs/news/TabsList/tabs_list_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../../../model/sourcesResponse.dart';

class TabsList extends StatefulWidget {
  String categoryID;

  TabsList({super.key , required this.categoryID});

  @override
  State<TabsList> createState() => _TabsListState();
}

class _TabsListState extends State<TabsList> {
  int currentTabIndex = 0;
  TabsListViewModel viewModel = TabsListViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.loadTabsList(widget.categoryID);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Builder(
        builder: (context){
          viewModel = Provider.of(context , listen: true); /// the most important line
        if(viewModel.state == TabsListState.loading){
          return const appLoader();
        }else if(viewModel.state == TabsListState.success){
          return tabsList(viewModel.sources);
        }else{
          return appError(error: viewModel.errorMessage , onRefreshClick: (){
            viewModel.loadTabsList(widget.categoryID);
          },);
        }
      },
      ),
    );


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
                return TabsDetails(sourceID: source.id!);
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
