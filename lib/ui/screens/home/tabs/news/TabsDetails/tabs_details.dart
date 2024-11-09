import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:news_app/Data/Repos/news_repo/data_sources/news_repo_impl.dart';
import 'package:news_app/model/articleResponse.dart';
import 'package:news_app/ui/comman%20widgets/app_error.dart';
import 'package:news_app/ui/comman%20widgets/app_loader.dart';
import 'package:news_app/ui/screens/home/tabs/news/TabsDetails/tabs_details_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../../../Data/Repos/news_repo/data_sources/local_data_source/news_local_data_source_impl.dart';
import '../../../../../../Data/Repos/news_repo/data_sources/remote_data_sources/news_remot_data_source_impl.dart';

class TabsDetails extends StatefulWidget {
  final String sourceID ;
  TabsDetails({super.key , required this.sourceID});
  

  @override
  State<TabsDetails> createState() => _TabsDetailsState();
}

class _TabsDetailsState extends State<TabsDetails> {
  TabsDetailsViewModel viewModel = TabsDetailsViewModel(NewsRepoImpl(
      NewsRemoteDataSourceImpl(),
      NewsLocalDataSourceImpl(),
    InternetConnection()
  ));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.loadArticles(widget.sourceID);
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Builder(
        builder: (context){
          viewModel = Provider.of(context , listen: true);
          if(viewModel.state == TabsDetailsState.loading){
            return appLoader();
          }else if(viewModel.state == TabsDetailsState.success){
            return articlesList(viewModel.articles);
          }else{
            return appError(error: viewModel.errorMessage , onRefreshClick:(){
              viewModel.loadArticles(widget.sourceID);
            },);
          }
        },
      ),
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

