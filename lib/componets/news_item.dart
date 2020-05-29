// import 'package:flutter_hub/model/article.dart';
// // import 'package:intl/intl.dart';
// import 'package:flutter/material.dart';

// class NewsCard extends StatelessWidget {
//   final Article article;

//   NewsCard(this.article, {Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var textTheme = Theme.of(context).textTheme.title;
    
//     return InkWell(
//       child: Card(
//         semanticContainer: true,
//         clipBehavior: Clip.antiAliasWithSaveLayer,
//         child: Column(children: <Widget>[
//           Image.network(
//             article.urlToImage,
//             fit: BoxFit.fill,
//           ),
//           Text(article.title, style: TextStyle(color: Colors.black)),
//         ]),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         elevation: 5,
//         margin: EdgeInsets.all(10),
//       ),
//       onTap: () {
//         Navigator.pushNamed(context, '/article', arguments: article);
//       },
//     );
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:flutter_hub/model/article.dart';
import 'package:flutter_hub/services/db_repo.dart';
import 'package:provider/provider.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

import '../main.dart';

class NewsItem extends StatefulWidget {
  final Article article;

  NewsItem(this.article, {Key key}) : super(key: key);

  @override
  _NewsItemState createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  Box<Article> favoriteBox;

  @override
  void initState() {
    super.initState();
    favoriteBox = Hive.box(NewsBox);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onFavoritePress,
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                LimitedBox(
                    maxHeight: 300,
                    child: Center(
                      child: kIsWeb
                          ? Image.network(
                        widget.article.urlToImage,
                        fit: BoxFit.fitWidth,
                      )
                          : CachedNetworkImage(
                        imageUrl: widget.article.urlToImage,
                        fit: BoxFit.fitWidth,
                        placeholder: (context, url) =>
                            center(CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            center(Icon(Icons.image)),
                      ),
                    )),
                Text(
                    widget.article.author != null ? widget.article.author : ""),
                const SizedBox(
                  height: 8,
                ),
                Text(widget.article.title),
                const SizedBox(
                  height: 8,
                ),
                Text(widget.article.publishedAt),
                getIcon(widget.article.id)
              ],
            )));
  }

  Widget getIcon(String id) {
    if (favoriteBox.containsKey(id)) {
      return Icon(Icons.favorite, color: Colors.red);
    }
    return Icon(Icons.favorite_border);
  }

  void onFavoritePress() {
    if (favoriteBox.containsKey(widget.article.id)) {
      favoriteBox.delete(widget.article.id);
      return;
    }
    favoriteBox.put(widget.article.id, widget.article);
  }

  center(Widget widget) => Container(
      height: 200, color: Colors.grey[200], child: Center(child: widget));
}