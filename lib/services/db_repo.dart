import 'package:hive/hive.dart';
import 'package:flutter_hub/model/article.dart';

import '../main.dart';

class DbRepository{
  Box<Article> favoriteNews = Hive.box(NewsBox);

  addArticle(Article article ) => 
    favoriteNews.put(article.id, article);

  List<Article> getArticles() => favoriteNews.values.toList();

  watch() => favoriteNews.watch(); 

}