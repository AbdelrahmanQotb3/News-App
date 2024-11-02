import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:news_app/Data/Repos/news_repo/data_sources/local_data_source/news_local_data_source.dart';
import 'package:news_app/Data/Repos/news_repo/data_sources/news_repo.dart';
import 'package:news_app/Data/Repos/news_repo/data_sources/remote_data_sources/news_remote_data_source.dart';
import 'package:news_app/model/sourcesResponse.dart';

class TabsListViewModel extends ChangeNotifier {
  TabsListState state = TabsListState.loading;

  List<Sources> sources = [];
  String errorMessage = "";
  NewsRepo newsRepo = NewsRepo(NewsRemoteDateSource(), NewsLocaldataSource(), InternetConnection());

  Future<void> loadTabsList(String categoryID) async {
    state = TabsListState.loading;
    try {
      SourceResponse sourceResponse = await newsRepo.loadTabsList(categoryID);
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
