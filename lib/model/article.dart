import 'package:flutter/material.dart';

class ArticleModel {
    // TODO

}

@immutable
class Article {

  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  Article({this.author, this.title, this.description, this.url, this.urlToImage, this.publishedAt, this.content});
  
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      author: json['author'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      urlToImage: json['urlToImage'] as String,
      publishedAt: json['publishedAt'] as String,
      content: json['content'] as String,
    );
  }
}
