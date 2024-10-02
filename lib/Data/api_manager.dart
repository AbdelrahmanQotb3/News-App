import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app/model/sourceResponse.dart';

abstract class APIManager{
  static Future loadTabsList() async {
    Uri url = Uri.parse("https://newsapi.org/v2/top-headlines/sources?apiKey=252ddd1becd44494a69378fa665e0d71");
    Response response = await get(url);
    // print("Response Body : \n ${response.body}");
    Map mapBody = jsonDecode(response.body);
    SourceResponse sourceResponse = SourceResponse.fromJson(mapBody);
  }
}