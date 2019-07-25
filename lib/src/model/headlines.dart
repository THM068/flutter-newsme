
import 'package:londonair/src/model/article.dart';

class HeadLines {
  String status;
  int totalResults;

  List<Article> articles;

  HeadLines({this.totalResults, this.status, this.articles});

  factory HeadLines.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['articles'] as List;
    return HeadLines( status: parsedJson['status'], totalResults: parsedJson['totalResults'],
          articles: list.map((i) => Article.fromJson(i)).toList()
       );
  }
}