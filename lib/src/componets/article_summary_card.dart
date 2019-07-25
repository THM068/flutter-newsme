import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:londonair/src/componets/image_place_holder_widget.dart';
import 'package:londonair/src/componets/news_icon.dart';
import 'package:londonair/src/constants/constants.dart';
import 'package:londonair/src/model/article.dart';

class ArticleSummaryCard extends StatelessWidget {
  final Article article;
  final articleIndex;
  final Function onTap;

  ArticleSummaryCard({@required this.article, this.articleIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: article.urlToImage != null
                  ? Image.network(
                      article.urlToImage,
                    )
                  : ImagePlaceHolderWidget(),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                article.title,
                style: kNewsTitleTextStyle,
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20.0, left: 5.0, bottom: 10.0),
              child: Text(
                " ${articleIndex.toString()} of ${kPageSize.toString()}",
                style: kNewsNumberTextStyle,
              ),
            ),
            Divider(
              indent: 5.0,
              endIndent: 5.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 5.0, bottom: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Read More:"),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        article.source.name,
                        style: kNewsSourceTextStyle,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Container(
                  child: NewsIcon(
                    icon: FontAwesomeIcons.bookmark,
                    onPressed: () {
                      print("I am pressed");
                    },
                  ),
                ),
                Container(
                  child: NewsIcon(
                    icon: FontAwesomeIcons.shareAlt,
                    onPressed: () {
                      print("I am pressed");
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
