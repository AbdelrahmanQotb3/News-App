import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app/model/articleResponse.dart';

import '../model/sourcesResponse.dart';

abstract class APIManager{
  static Future<SourceResponse> loadTabsList() async {
    try{
      Uri url = Uri.parse("https://newsapi.org/v2/top-headlines/sources?apiKey=252ddd1becd44494a69378fa665e0d71");
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

  static Future<ArticleResponse> loadTabDetails(String sourceID) async{
    try {
      Uri url = Uri.parse("https://newsapi.org/v2/everything?apiKey=252ddd1becd44494a69378fa665e0d71&sources=${sourceID}");
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