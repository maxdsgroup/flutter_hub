import 'dart:js';

import 'package:flutter/foundation.dart';
import 'package:news_app/services/api.dart';

import 'article.dart';

class ArticlesHolder extends ChangeNotifier {


  ArticlesHolder(){
    ApiClass api = new ApiClass();
    api.fetchArticles(context).then((value)=> articles = value);
  }

  // TODO

}
