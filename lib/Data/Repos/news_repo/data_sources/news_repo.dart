import '../../../../model/articleResponse.dart';
import '../../../../model/sourcesResponse.dart';

abstract class NewsRepo {

  Future<SourceResponse> loadTabsList(String categoryID);

  Future<ArticleResponse> loadTabDetails(String sourceID);
}