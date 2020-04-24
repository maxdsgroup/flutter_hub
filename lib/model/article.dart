import 'package:flutter/material.dart';

class Article {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  Map<String, dynamic> toJSONObj(){
      Map<String, dynamic> json = new Map<String, dynamic> ();
        json = {
        title: this.title,
        description: this.description,
        url: this.url,
        urlToImage: this.urlToImage,
        publishedAt: this.publishedAt,
        content: this.content,
        };
        return json;
    }

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
