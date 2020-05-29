import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
// import 'package:http/http.dart' as http;
import 'package:flutter_hub/model/article.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

const String API = "http://newsapi.org/v2/";
const String TOP_HEADLINES = "top-headlines";
const String TOKEN = "26d24a77790a428286f73690b969e3bb";

const timeout = Duration(seconds: 3);

class ApiClass {

  final Dio dio = Dio();
  final DioCacheManager dioCache = DioCacheManager(CacheConfig(baseUrl: API));

  ApiClass() {
    dio.options.baseUrl = API;
    dio.options.connectTimeout = 5000;
    dio.transformer = FlutterTransformer();

    if(!kIsWeb) dio.interceptors.add(dioCache.interceptor);

      dio.interceptors.add(InterceptorsWrapper(
          onRequest: (RequestOptions options) async {
            if(options.extra.isNotEmpty){
              options.queryParameters.addAll(options.extra);
            }
            options.queryParameters['apiKey'] = TOKEN;
            options.queryParameters['country'] = "it";
            return options;
          },
          onResponse: (Response response) async {
            // Do something with response data
            return response; // continue
          },
          onError: (DioError e) async {
            // Do something with response error
            return e; //continue
          }
      ));
  }

  // Future<List<Article>> fetchArticles(context) async {
  Future<List<Article>> fetchArticles() async {
  Response response = await dio.get(TOP_HEADLINES,
      options: buildCacheOptions(Duration(seconds: 30)));
  //  return response.data['articles'].map<Article>((json) =>
  //      Article.fromJson(json)).toList();
      return _parseArticle(response.data);
  }

  // CALL with HTTP
  // Future<List<Article>> fetchArticles(context) async {
  //   final response = await http
  //       .get("$API$TOP_HEADLINES?country=us&apiKey=$TOKEN")
  //       .timeout(timeout);

  //   return _parseArticle(response.body);
  // }

  static List<Article> _parseArticle(dynamic response) {
    // final parsed = json.decode(responseBody);
    return response['articles'].map<Article>((json) => 
        Article.fromJson(json)).toList();
  }

}
