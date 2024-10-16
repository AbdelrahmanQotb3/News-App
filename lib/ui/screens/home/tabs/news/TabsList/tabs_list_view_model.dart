import 'package:flutter/material.dart';
import 'package:news_app/Data/api_manager.dart';
import 'package:news_app/model/sourcesResponse.dart';

class TabsListViewModel extends ChangeNotifier {
  TabsListState state = TabsListState.loading;

  List<Sources> sources = [];
  String errorMessage = "";

  Future<void> loadTabsList(String categoryID) async {
    state = TabsListState.loading;
    try {
      SourceResponse sourceResponse = await APIManager.loadTabsList(categoryID);
      state = TabsListState.success;
      sources = sourceResponse.sources!;
    } catch (exception) {
      state = TabsListState.error;
      errorMessage = exception.toString();
    }
  }
}

enum TabsListState {
  loading,
  success,
  error,
}
