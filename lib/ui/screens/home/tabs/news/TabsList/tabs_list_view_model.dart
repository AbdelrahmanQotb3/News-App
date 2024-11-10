import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Data/Repos/news_repo/data_sources/news_repo.dart';
import 'package:news_app/model/sourcesResponse.dart';

class TabsListViewModel extends Cubit<TabsListState> {
  NewsRepo repo ;

  TabsListViewModel(this.repo) : super(TabsListState());

  Future<void> loadTabsList(String categoryID) async {
    // state = apiState.loading;
    emit(TabsListState(tabsState: apiState.loading));
    try {
      SourceResponse sourceResponse = await repo.loadTabsList(categoryID);
      // state = apiState.success;
      // sources = sourceResponse.sources!;
      emit(TabsListState(sources: sourceResponse.sources! , tabsState: apiState.success));
      // notifyListeners();
    } catch (exception) {
      // state = apiState.error;
      // errorMessage = exception.toString();
      emit(TabsListState(tabsState: apiState.error , errorMessage: exception.toString()));
      // notifyListeners();
    }
  }
}

class TabsListState{
  apiState tabsState;
  List<Sources> sources = [];
  String errorMessage = "";
  TabsListState({this.tabsState = apiState.loading,this.sources =const[] , this.errorMessage = ""});
}

enum apiState {
  loading,
  success,
  error,
}
