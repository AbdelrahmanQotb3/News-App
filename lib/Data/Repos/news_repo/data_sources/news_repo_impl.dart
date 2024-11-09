import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:news_app/Data/Repos/news_repo/data_sources/news_repo.dart';
import 'package:news_app/Data/Repos/news_repo/data_sources/remote_data_sources/news_remote_data_source.dart';

import '../../../../model/articleResponse.dart';
import '../../../../model/sourcesResponse.dart';
import 'local_data_source/news_local_data_source.dart';

class NewsRepoImpl extends NewsRepo{
  NewsLocalDataSource newsLocalDataSource;
  NewsRemoteDateSource newsRemoteDateSource;
  InternetConnection connection ;

  NewsRepoImpl(this.newsRemoteDateSource , this.newsLocalDataSource , this.connection);
  @override
  Future<SourceResponse> loadTabsList(String categoryID) async {

    if(await connection.hasInternetAccess){
      SourceResponse response = await newsRemoteDateSource.loadTabsList(categoryID);
      newsLocalDataSource.saveTabsResponse(categoryID , response);
      return response;
    }
    else{
      SourceResponse? response = await newsLocalDataSource.loadTabsList(categoryID);
      return response!;
    }

  }

  @override
  Future<ArticleResponse> loadTabDetails(String sourceID) async{

    if(await connection.hasInternetAccess){
      ArticleResponse response = await newsRemoteDateSource.loadTabDetails(sourceID);
      newsLocalDataSource.saveArticles(sourceID, response);
      return response;
    }else{
      ArticleResponse? response = await newsLocalDataSource.loadTabDetails(sourceID);
      return response!;
    }
  }
}