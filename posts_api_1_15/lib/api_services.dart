import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:posts_api_1_15/constants.dart';
import 'package:posts_api_1_15/post_model/post_model.dart';

class ApiServices {
  //1) convert url from String to Url (Uri.parse)
  //2) requste api using http (GET methode)
  //3) check if statusCode == 200 (OK / SUCCESS)
  //4) convert response string to json (jsonDecode())
  //5) parse <list of map> to <list of postModel>

 static Future<List<PostModel>?> getPosts() async {
    try {
      //  ----------- 1
      var url = Uri.parse(AppConstants.baseUrl + AppConstants.postsEndpoint);
      var res = await http.get(url);
      if (res.statusCode == 200) {
        List data = jsonDecode(res.body);
        List<PostModel> posts = data.map((e) => PostModel.fromJson(e)).toList();
        return posts;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
