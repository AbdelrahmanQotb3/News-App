import 'package:news_app/model/articleResponse.dart';

import '../../../../../model/sourcesResponse.dart';

abstract class NewsRemoteDateSource{
   Future<SourceResponse> loadTabsList(String categoryID);

   Future<ArticleResponse> loadTabDetails(String sourceID);
}