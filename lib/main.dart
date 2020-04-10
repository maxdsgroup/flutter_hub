import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'themes/theme.dart';
import 'model/article.dart';
import 'model/articleHolder.dart';

void main() {
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
        title: 'News Demo',
        theme: appTheme,
        initialRoute: '/',
        routes: {
        },
      ),
    );
  }
}
