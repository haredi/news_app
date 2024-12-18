import 'package:injectable/injectable.dart';
import 'package:news_app/data/data_source-contract/articles_datasource.dart';
import 'package:news_app/data/model/articles_response/article.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/result.dart';

import '../../domain/repository_contract/articles_repo_contract.dart';
@Injectable(as:ArticlesRepository )
class ArticlesRepositoryImpl extends ArticlesRepository {
  ArticlesDatasource datasource;
  @factoryMethod
  ArticlesRepositoryImpl({required this.datasource});
  @override
  Future<Result<List<ArticleEntity>>> getArticles(String sourceId) async {
    var result = await datasource.getArticles(sourceId);

    switch (result) {
      case Success<List<Article>>():
        return Success(
            data: result.data
                .map((article) => article.toArticleEntity())
                .toList());
      case ServerError<List<Article>>():
        return ServerError(message: result.message, code: result.code);
      case Error<List<Article>>():
        return Error(exception: result.exception);
    }
  }

  @override
  Future<Result<List<ArticleEntity>>> searchInArticles(String query) async{
    var result = await datasource.searchInArticles(query);

    switch (result) {
      case Success<List<Article>>():
        return Success(
            data: result.data.map((article) =>article.toArticleEntity() ,).toList()
                );
      case ServerError<List<Article>>():
        return ServerError(message: result.message, code: result.code);
      case Error<List<Article>>():
        return Error(exception: result.exception);
    }
  }
}
