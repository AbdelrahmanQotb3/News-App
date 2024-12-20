import 'dart:convert';

import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/Data/Repos/news_repo/data_sources/remote_data_sources/news_remote_data_source.dart';

import '../../../../../model/articleResponse.dart';
import '../../../../../model/sourcesResponse.dart';

@Injectable(as:NewsRemoteDateSource )
class NewsRemoteDataSourceImpl extends NewsRemoteDateSource{
  static String apiKey = "252ddd1becd44494a69378fa665e0d71";

  @override
  Future<SourceResponse> loadTabsList(String categoryID) async {
    try{
      Uri url = Uri.parse("https://newsapi.org/v2/top-headlines/sources?apiKey=$apiKey&category=$categoryID");
      Response response = await get(url);
      // print("Response Body : \n ${response.body}");
      SourceResponse sourcesResponse = SourceResponse.fromJson(jsonDecode(response.body));
      if(response.statusCode >= 200 && response.statusCode < 300){
        return sourcesResponse;
      }else{
        throw "Something went wrong , Please try again later.";
      }
    }catch(e){
      rethrow;
    }
  }

  @override
  Future<ArticleResponse> loadTabDetails(String sourceID) async{
    try {
      Uri url = Uri.parse("https://newsapi.org/v2/everything?apiKey=$apiKey&sources=${sourceID}");
      Response apiResponse = await get(url);
      ArticleResponse articleResponse = ArticleResponse.fromJson(jsonDecode(apiResponse.body));
      if(apiResponse.statusCode >= 200 && apiResponse.statusCode < 300){
        return articleResponse;
      }else{
        throw "Something went wrong , Please try again later." ;
      }
    } catch(e){
      rethrow ;
    }


  }
}