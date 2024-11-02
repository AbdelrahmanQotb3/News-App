import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:news_app/Data/Repos/news_repo/data_sources/local_data_source/news_local_data_source.dart';
import 'package:news_app/Data/Repos/news_repo/data_sources/news_repo.dart';
import 'package:news_app/model/articleResponse.dart';
import 'package:provider/provider.dart';

import '../../../../../../Data/Repos/news_repo/data_sources/remote_data_sources/news_remote_data_source.dart';

class TabsDetailsViewModel extends ChangeNotifier{
  TabsDetailsState state = TabsDetailsState.loading;
  List<Article> articles = [];
  String errorMessage = '';
  NewsRepo newsRepo = NewsRepo(NewsRemoteDateSource(), NewsLocaldataSource(), InternetConnection());

  void loadArticles(String sourceID) async {
    try{
      state = TabsDetailsState.loading;
      ArticleResponse articleResponse = await newsRepo.loadTabDetails(sourceID);
      state = TabsDetailsState.success;
      articles = articleResponse.articles;
      notifyListeners();
    }catch(exception){
      state = TabsDetailsState.error;
      errorMessage = exception.toString();
      notifyListeners();
    }
  }
}

enum TabsDetailsState {
  loading,
  success,
  error,
}