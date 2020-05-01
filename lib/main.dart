import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'themes/theme.dart';
import 'model/articleHolder.dart';
import 'package:news_app/screens/login.dart';
import 'package:news_app/screens/news.dart';
import 'package:news_app/model/article.dart';
import 'dart:convert';

const String NewsBox = "NewsBox";
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ArticleAdapter());

  await Hive.openBox<Article>(NewsBox);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Using MultiProvider is convenient when providing multiple objects.
    return MultiProvider(
      providers: [
        Provider(create: (context) => ArticlesHolder()),
        ChangeNotifierProvider<ArticlesHolder>(
          create: (context) => ArticlesHolder()
        ),
      ],
      child: MaterialApp(
        title: 'News App',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => MyLogin(),
          '/news': (context) => News(),
          //'/other': (context) => Other(),
        },
      ),
    );
  }
}
