import 'package:news_app/domain/repository_contract/articles_repo_contract.dart';

import '../../result.dart';
import '../entities/article_entity.dart';

class GetArticlesUseCase{
  ArticlesRepository repository;
  GetArticlesUseCase({required this.repository});
  Future<Result<List<ArticleEntity>>> execute(String sourceId){
    return repository.getArticles(sourceId);
  }

  Future<Result<List<ArticleEntity>>> executeSearch(String query){
    return repository.searchInArticles(query);
  }


}