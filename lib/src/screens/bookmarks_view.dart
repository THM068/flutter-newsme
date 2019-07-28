import 'package:flutter/material.dart';
import 'package:londonair/src/componets/article_summary_card.dart';
import 'package:londonair/src/model/article.dart';
import 'package:londonair/src/services/book_mark_service.dart';
import 'package:londonair/src/services/service_locator.dart';


class BookMarksView extends StatefulWidget {
  @override
  _BookMarksViewState createState() => _BookMarksViewState();
}

class _BookMarksViewState extends State<BookMarksView> {


  @override
  Widget build(BuildContext context) {
    List<Article> articles = sl.get<BookMarkService>().getArticles;
    return Container(child:
        ListView.builder(
        itemCount: articles.length,
        itemBuilder: (BuildContext ctxt, int index) {
          Article article = articles[index];
          return ArticleSummaryCard(
            article: article,
            articleIndex: index + 1,
            onTap: () {
              //openArticleInWebviewFor(article, context);
            },
          );
        }));
  }

  void _test() {
    print("size: ");
    print( sl.get<BookMarkService>().getArticles.length);
    for(Article article in sl.get<BookMarkService>().getArticles) {
       print(article.url);
    }
  }
}
