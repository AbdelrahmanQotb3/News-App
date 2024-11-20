import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/Data/Repos/news_repo/data_sources/news_repo.dart';
import 'package:news_app/model/articleResponse.dart';

@injectable
class TabsDetailsViewModel extends ChangeNotifier{
  TabsDetailsState state = TabsDetailsState.loading;
  List<Article> articles = [];
  String errorMessage = '';
  NewsRepo repo;

  TabsDetailsViewModel(this.repo);

  void loadArticles(String sourceID) async {
    try{
      state = TabsDetailsState.loading;
      ArticleResponse articleResponse = await repo.loadTabDetails(sourceID);
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