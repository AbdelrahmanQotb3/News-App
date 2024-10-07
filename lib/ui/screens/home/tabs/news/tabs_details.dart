import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Data/api_manager.dart';
import 'package:news_app/model/articleResponse.dart';
import 'package:news_app/ui/comman%20widgets/app_error.dart';
import 'package:news_app/ui/comman%20widgets/app_loader.dart';

class TabsDetails extends StatefulWidget {
  final String sourceID ;
  TabsDetails({super.key , required this.sourceID});

  @override
  State<TabsDetails> createState() => _TabsDetailsState();
}

class _TabsDetailsState extends State<TabsDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: APIManager.loadTabDetails(widget.sourceID),
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
        CachedNetworkImage(
          imageUrl: article.urlToImage!,
          placeholder: (_ , __)=> Center(child: CircularProgressIndicator()),
          errorWidget: (_ , __ , ___) => Center(child: Icon(Icons.error)),

        ),
        Text(article.source.name ?? ""),
        Text(article.title ?? ""),
        Text(article.publishedAt?? ""),
      ],
    );
  }
}
