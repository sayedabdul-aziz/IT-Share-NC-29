import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:insights_news_1_11/core/news_model/news_model.dart';

class ApiServices {
// https://newsapi.org/v2/top-headlines?country=de&category=business&apiKey=a8a72be0b04c4e82901e0ae29fe26689
  Future<NewsModel?> getNewsByCategory(category) async {
    try {
      var url = Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=a8a72be0b04c4e82901e0ae29fe26689');

      var res = await http.get(url);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        NewsModel news = NewsModel.fromJson(data);
        return news;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<NewsModel?> getNewsBySource(source) async {
    try {
      var url = Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&sources=$source&apiKey=a8a72be0b04c4e82901e0ae29fe26689');

      var res = await http.get(url);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        NewsModel news = NewsModel.fromJson(data);
        return news;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
