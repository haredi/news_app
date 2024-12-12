import 'package:news_app/data/model/articles_response/article.dart';
import 'package:news_app/result.dart';

abstract class ArticlesRepository{
  Future<Result<List<Article>>> getArticles(String sourceId);
}