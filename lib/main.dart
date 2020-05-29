import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'bimby/bimby-detail.dart';
import 'bimby/bimby-list.dart';
import 'bimby/bimby-map.dart';
// import 'bimby/bimby.dart';
import 'screens/login.dart';
//
import 'bimby/bimby-home.dart';
//
import 'screens/news.dart';
// import 'screens/todo.dart';
import 'screens/todo-two.dart';
import 'screens/animations.dart';

import 'themes/theme.dart';
import 'model/articleHolder.dart';
import 'model/article.dart';
// import 'dart:convert';

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
        title: 'Flutter Hub App',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => Login(), // START PAGE
          '/bimby-home': (context) => BimbyHome(title: "HOME"),
          '/bimby-list': (context) => BimbyList(title: "CLIENTI"),
          // '/bimby': (context) => Bimby(title: "HOME"),
          '/bimby-detail': (context) => BimbyDetail(title: "SCHEDA CLIENTI"),
          '/bimby-map': (context) => BimbyMap(title: "MAPPA"),
          '/news': (context) => News(),
          '/animations': (context) => AnimationsTest(),
          // '/todo': (context) => Todo(),
          '/todotwo': (context) => TodoTwo(),
        },
      ),
    );
  }
}