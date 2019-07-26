import 'package:flutter/material.dart';
import 'package:londonair/src/componets/article_summary_card.dart';
import 'package:londonair/src/componets/reuseblecomponents.dart';
import 'package:londonair/src/model/article.dart';
import 'package:londonair/src/model/headlines.dart';
import 'package:londonair/src/services/news_api_service.dart';
import 'package:londonair/src/services/service_locator.dart';

import 'news_webview.dart';

class TopNewsPage extends StatefulWidget {
  @override
  _TopNewsPageState createState() => _TopNewsPageState();
}

class _TopNewsPageState extends State<TopNewsPage> {
  final NewsApiService newsApiService = sl.get<NewsApiService>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: FutureBuilder<HeadLines>(
            future: this.newsApiService.getTopHeadlines(),
            builder: (BuildContext context, AsyncSnapshot<HeadLines> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text('Press button to start.');
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return displayProgressIndicator();
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  HeadLines headLines = snapshot.data;
                  return ListView.builder(
                      itemCount: headLines.articles.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        Article article = headLines.articles[index];
                        return ArticleSummaryCard(
                          article: article,
                          articleIndex: index + 1,
                          onTap: () {
                            openArticleInWebviewFor(article, context);
                          },
                        );
                      });
              }
            }),
      );
  }

  void openArticleInWebviewFor(Article article, BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => NewsWebView(url: article.url)));
  }

}
