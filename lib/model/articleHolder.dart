import 'dart:js' show context;

import 'package:flutter/foundation.dart';
import 'package:news_app/services/api.dart';

import 'article.dart';

class ArticlesHolder extends ChangeNotifier {
  
  List<Article> _articles = [];

  ArticlesHolder(){
    ApiClass api = new ApiClass();
    api.fetchArticles(context).then((value)=> articles = value);
    notifyListeners();
  }

  set articles(List<Article> news) {
    assert(news != null);
    _articles = news;
    notifyListeners();
  }

  /// List of items
  List<Article> get items => _articles;

}
