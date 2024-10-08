import 'package:cached_network_image/cached_network_image.dart';
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
        return articleWidget(context,articles[index]);
      },
    );

  }

  Widget articleWidget(BuildContext context,Article article) {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: article.urlToImage!,
          height: MediaQuery.of(context).size.height * 0.2,
          placeholder: (_ , __)=> const Center(child: CircularProgressIndicator()),
          errorWidget: (_ , __ , ___) => const Center(child: Icon(Icons.error)),

        ),
        // Image.network(article.urlToImage!),
        Text(article.source.name , textAlign: TextAlign.start,style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold
        ),
        ),
        Text(article.title , textAlign: TextAlign.start,style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500
        ),),
        Text(article.publishedAt , textAlign: TextAlign.end,style: TextStyle(
          fontSize: 12
        ),),
      ],
    );
  }
}
