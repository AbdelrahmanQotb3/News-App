import 'package:flutter/material.dart';
import 'package:news_app/Data/Repos/news_repo/data_sources/news_repo.dart';
import 'package:news_app/model/sourcesResponse.dart';

class TabsListViewModel extends ChangeNotifier {
  TabsListState state = TabsListState.loading;

  List<Sources> sources = [];
  String errorMessage = "";
  NewsRepo repo ;

  TabsListViewModel(this.repo);

  Future<void> loadTabsList(String categoryID) async {
    state = TabsListState.loading;
    try {
      SourceResponse sourceResponse = await repo.loadTabsList(categoryID);
      state = TabsListState.success;
      sources = sourceResponse.sources!;
      notifyListeners();
    } catch (exception) {
      state = TabsListState.error;
      errorMessage = exception.toString();
      notifyListeners();
    }
  }
}

enum TabsListState {
  loading,
  success,
  error,
}
