import 'package:flutter/material.dart';
import 'package:news_app/Data/api_manager.dart';
import 'package:news_app/model/sourceResponse.dart';
import 'package:news_app/ui/comman%20widgets/app_error.dart';
import 'package:news_app/ui/comman%20widgets/app_loader.dart';

class TabsList extends StatelessWidget {
  static String routeName = "TabsList";
  const TabsList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: APIManager.loadTabsList(),
        builder: (context , snapshot){
          if(snapshot.hasError){
            return appError(error: snapshot.error.toString());
          }else if(snapshot.hasData){
            return tabsList(snapshot.data!.sources!);
          }else{
            return appLoader();
          }
        }
    );
  }


  Widget tabsList(List<Sources> sources) {
    return Text("Successfull API call");
  }

}



