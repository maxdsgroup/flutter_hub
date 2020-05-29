import 'package:flutter/material.dart';
import 'package:flutter_hub/model/articleHolder.dart';
import 'package:provider/provider.dart';

class ArticleDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Detail', style: Theme.of(context).textTheme.display4),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.blue,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: _NewsList(),
              ),
            ),
            Divider(height: 4, color: Colors.black),
          ],
        ),
      ),
    );
  }
}

class _NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.title;
    var article = Provider.of<ArticlesHolder>(context);

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        title: Text( article.items[index].title,
          style: itemNameStyle,
        ),
      ),
    );
  }
}

