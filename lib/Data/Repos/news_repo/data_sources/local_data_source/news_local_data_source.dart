import '../../../../../model/articleResponse.dart';
import '../../../../../model/sourcesResponse.dart';

class NewsLocaldataSource{
  Future<SourceResponse> loadTabsList(String categoryID) async {
    throw '';
  }

  Future<ArticleResponse> loadTabDetails(String sourceID) async{
    throw '';

  }
  Future<void> saveTabsResponse(String categoryID , SourceResponse response) async {
    throw '';
  }

  Future<void> saveArticles(String sourceID , ArticleResponse response) async{
    throw '';

  }
}