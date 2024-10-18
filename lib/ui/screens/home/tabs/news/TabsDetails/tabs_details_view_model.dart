import 'package:flutter/material.dart';
import 'package:news_app/model/articleResponse.dart';
import 'package:provider/provider.dart';

import '../../../../../../Data/api_manager.dart';

class TabsDetailsViewModel extends ChangeNotifier{
  TabsDetailsState state = TabsDetailsState.loading;
  List<Article> articles = [];
  String errorMessage = '';

  void loadArticles(String sourceID) async {
    try{
      state = TabsDetailsState.loading;
      ArticleResponse articleResponse = await APIManager.loadTabDetails(sourceID);
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