import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/article.dart';

const String API = "http://newsapi.org/v2/";
const String TOP_HEADLINES = "top-headlines";
const String TOKEN = "26d24a77790a428286f73690b969e3bb";

const timeout = Duration(seconds: 3);

class ApiClass {

  // final Dio dio = Dio();

  // ApiClass(){
  //   dio.options.baseUrl = API;
  //    dio.options.connetionTimeout = 5000;
  //    dio.transformer = FlutterTransformer();
  // }

  Future<List<Article>> fetchArticles(context) async {
    final response = await http
        .get("$API$TOP_HEADLINES?country=us&apiKey=$TOKEN")
        .timeout(timeout);

    return _parseArticle(response.body);
  }

  static List<Article> _parseArticle(String responseBody) {
    final parsed = json.decode(responseBody);

    return parsed["articles"].map<Article>((json) => 
        Article.fromJson(json)).toList();
  }
}
