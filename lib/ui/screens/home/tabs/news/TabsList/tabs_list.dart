import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:news_app/Data/Repos/news_repo/data_sources/news_repo_impl.dart';
import 'package:news_app/Data/Repos/news_repo/data_sources/remote_data_sources/news_remot_data_source_impl.dart';
import 'package:news_app/ui/comman%20widgets/app_error.dart';
import 'package:news_app/ui/comman%20widgets/app_loader.dart';
import 'package:news_app/ui/screens/home/tabs/news/TabsDetails/tabs_details.dart';
import 'package:news_app/ui/screens/home/tabs/news/TabsList/tabs_list_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../../../Data/Repos/news_repo/data_sources/local_data_source/news_local_data_source_impl.dart';
import '../../../../../../model/sourcesResponse.dart';

class TabsList extends StatefulWidget {
  String categoryID;

  TabsList({super.key , required this.categoryID});

  @override
  State<TabsList> createState() => _TabsListState();
}

class _TabsListState extends State<TabsList> {
  int currentTabIndex = 0;
  TabsListViewModel viewModel = TabsListViewModel(NewsRepoImpl(
    NewsRemoteDataSourceImpl(),
    NewsLocalDataSourceImpl(),
    InternetConnection()
  ));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.loadTabsList(widget.categoryID);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder< TabsListViewModel, TabsListState>(
      bloc: viewModel,
      builder: (context , state){
        if(state.tabsState == apiState.loading){
          return const appLoader();
        }else if(state.tabsState == apiState.success){
          return tabsList(state.sources);
        }else{
          return appError(error: state.errorMessage , onRefreshClick: (){
            viewModel.loadTabsList(widget.categoryID);
          },);
        }
      },
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
