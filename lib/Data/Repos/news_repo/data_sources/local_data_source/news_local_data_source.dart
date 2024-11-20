import 'package:injectable/injectable.dart';

import '../../../../../model/articleResponse.dart';
import '../../../../../model/sourcesResponse.dart';

abstract class NewsLocalDataSource{
  Future<SourceResponse?> loadTabsList(String categoryID);

  Future<ArticleResponse?> loadTabDetails(String sourceID);

  Future<void> saveTabsResponse(String categoryID , SourceResponse response);

  Future<void> saveArticles(String sourceID , ArticleResponse response);
}