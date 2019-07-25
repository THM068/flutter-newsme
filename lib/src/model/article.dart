
import 'package:londonair/src/model/source.dart';

class Article {

  String author;
  String title;
  String description;
  String urlToImage;
  String url;
  String publishedAt;
  String content;
  Source source;

  Article({this.author, this.title, this.description, this.urlToImage,
           this.url, this.publishedAt, this.content, this.source });

  factory Article.fromJson(Map<String, dynamic> parsedJson) {
    var sourceMap = parsedJson['source'];
    Source source = Source.fromJson(sourceMap);
    return Article(author: parsedJson['author'], title: parsedJson['title'], description: parsedJson['description'],
                   urlToImage: parsedJson['urlToImage'], url: parsedJson['url'], publishedAt: parsedJson['publishedAt'],
                   content: parsedJson['content'], source: source);
  }

}


