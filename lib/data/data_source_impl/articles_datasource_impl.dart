import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/data_source-contract/articles_datasource.dart';
import 'package:news_app/data/model/articles_response/article.dart';
import 'package:news_app/result.dart';

class ArticlesApiDatasourceImpl extends ArticlesDatasource{
  ApiManager apiManager;
  ArticlesApiDatasourceImpl({required this.apiManager});
  @override
  Future<Result<List<Article>>> getArticles(String sourceId) {
    return apiManager.getArticles(sourceId);
  }

}