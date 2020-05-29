import 'package:flutter_hub/model/articleHolder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _MyAppBar(),
          SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => _MyListItem(index)),
          ),
        ],
      ),
    );
  }
}

class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('News', style: Theme.of(context).textTheme.headline5),
      floating: true,
      actions: [
        Row(
          children: <Widget>[
            Consumer<ArticlesHolder>(
                builder: (context, articles, child) => Text(
                    'search:',
                    style: Theme.of(context).textTheme.bodyText1)),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () => Navigator.pushNamed(context, '/search'),
            ),
          ],
        )
      ],
    );
  }
}

class _MyListItem extends StatelessWidget {
  final int index;

  _MyListItem(this.index, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var news = Provider.of<ArticlesHolder>(context);
    var item = news.items[index];
    var textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        // maxHeight: 200,
        child: Row(
          children: [
            Expanded(
              child: 
                Column(
                  children: <Widget>[
                    Image.network(
                    item.urlToImage,
                    fit: BoxFit.fill,
                  ),
                  Text(item.title, style: textTheme.headline6),
                  ]
                ),
              ),
          ],
        ),
      ),
    );
  }
}
