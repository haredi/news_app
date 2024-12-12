import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/data_source_impl/articles_datasource_impl.dart';
import 'package:news_app/data/data_source_impl/sources_datasource_impl.dart';
import 'package:news_app/data/repository_impl/articles_repository_impl.dart';
import 'package:news_app/data/repository_impl/sources_repository_impl.dart';
import 'package:news_app/domain/usecases/articles_usecase.dart';
import 'package:news_app/domain/usecases/sources_usecase.dart';

getSourcesUseCase(){
  return GetSourcesUseCase(repository: getSourcesRepository());
}
GetArticlesUseCase getArticlesUseCase(){
  return GetArticlesUseCase(repository: getArticleRepository());
}
ArticlesRepositoryImpl getArticleRepository(){
  return ArticlesRepositoryImpl(datasource: getArticleDatasource());
}
ArticlesApiDatasourceImpl getArticleDatasource(){
  return ArticlesApiDatasourceImpl(apiManager: getApiManager());
}

ApiManager getApiManager(){
  return ApiManager();
}




SourcesRepositoryImpl getSourcesRepository(){
  return SourcesRepositoryImpl(datasource: getSourceDatasource());
}

SourcesApiDatasourceImpl getSourceDatasource(){
  return SourcesApiDatasourceImpl(apiManager: getApiManager());
}