import 'package:flutter/material.dart';
import 'package:news_app/Data/api_manager.dart';
import 'package:news_app/model/articleResponse.dart';
import 'package:news_app/ui/comman%20widgets/app_error.dart';
import 'package:news_app/ui/comman%20widgets/app_loader.dart';

class TabsDetails extends StatelessWidget {
  final String sourceID ;
  TabsDetails({super.key , required this.sourceID});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: APIManager.loadTabDetails(sourceID),
        builder: (context, snapshot){
          if(snapshot.hasError){
            return appError(error: snapshot.error.toString());
          }else if(snapshot.hasData){
            return articlesList(snapshot.data!.articles);
          }else{
            return appLoader();
          }
        }
    );
  }

  Widget articlesList(List<Article> articles) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context , index){
        return articleWidget(articles[index]);
      },
    );

  }

  Widget articleWidget(Article article) {
    return Column(
      children: [
        Image.network(article.urlToImage ?? ""),
        Text(article.source.name ?? ""),
        Text(article.title ?? ""),
        Text(article.publishedAt?? ""),
      ],
    );
  }


}
