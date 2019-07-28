import 'package:londonair/src/model/article.dart';

class BookMarkService {

  final List<Article> _articleList = List<Article>();


  List<Article> get getArticles => this._articleList;

  void setArticle(Article article) {
    this._articleList.add(article);
  }


}