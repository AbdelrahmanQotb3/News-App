import 'dart:convert';

import 'package:http/http.dart';

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
}