import 'package:flutter/material.dart';
import 'package:news_app/Data/api_manager.dart';
import 'package:news_app/model/sourceResponse.dart';

class TabsList extends StatelessWidget {
  static String routeName = "TabsList";
  const TabsList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: APIManager.loadTabsList(),
        builder: (context , snapshot){
          if(snapshot.hasError){
            return errorView(snapshot.error.toString());
          }else if(snapshot.hasData){
            return tabsList(snapshot.data!.sources!);
          }else{
            return loadingView();
          }
        }
    );
  }

  Widget errorView(String error) {
    return Column(
      children: [
        Text(error),
        ElevatedButton(onPressed: (){}, child: Text("Refresh"))
      ],
    );
  }

  Widget tabsList(List<Sources> sources) {
    return Text("Successfull API call");
  }

  Widget loadingView() {
    return Center(child: CircularProgressIndicator());
  }
}
