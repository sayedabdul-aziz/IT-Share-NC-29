import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:insights_news_1_11/core/news_model/news_model.dart';

class ApiServices {
// https://newsapi.org/v2/top-headlines?country=de&category=business&apiKey=48b16be6252e45a1a3a491c5c6496d72
  Future<NewsModel?> getNewsByCategory(category) async {
    try {
      var url = Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=48b16be6252e45a1a3a491c5c6496d72');

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

  // --------------- serch for news

  Future<NewsModel?> getNewsBySearch(searchKey) async {
    try {
      var url = Uri.parse(
          'https://newsapi.org/v2/top-headlines?q=$searchKey&apiKey=48b16be6252e45a1a3a491c5c6496d72');

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
          'https://newsapi.org/v2/top-headlines?country=us&sources=$source&apiKey=48b16be6252e45a1a3a491c5c6496d72');

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
