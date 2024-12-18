import 'package:injectable/injectable.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/data_source-contract/articles_datasource.dart';
import 'package:news_app/data/model/articles_response/article.dart';
import 'package:news_app/result.dart';
@Injectable(as: ArticlesDatasource)
class ArticlesApiDatasourceImpl extends ArticlesDatasource{
  ApiManager apiManager;
  @factoryMethod
  ArticlesApiDatasourceImpl({required this.apiManager});
  @override
  Future<Result<List<Article>>> getArticles(String sourceId) async{
   var result= await apiManager.getArticles(sourceId);

   switch(result){

     case Success<List<Article>>():
       return Success(data: result.data);
     case ServerError<List<Article>>():
       return ServerError(message: result.message, code: result.code);
     case Error<List<Article>>():
       return Error(exception: result.exception);
   }
  }

  @override
  Future<Result<List<Article>>> searchInArticles(String query) async {
    var result= await apiManager.searchInArticles(query);
    switch(result){
      case Success<List<Article>>():
        return Success(data: result.data);
      case ServerError<List<Article>>():
        return ServerError(message: result.message, code: result.code);
      case Error<List<Article>>():
        return Error(exception: result.exception);
    }
  }


}

// class ArticlesFireStoreDatasourceImp extends ArticlesDatasource{
//   @override
//   Future<Result<List<Article>>> getArticles(String sourceId) {
//     // TODO: implement getArticles
//     throw UnimplementedError();
//     // u should get articles list from fireStore
//   }
//
// }
//
// class ArticlesCacheDatasourceImp extends ArticlesDatasource{
//   @override
//   Future<Result<List<Article>>> getArticles(String sourceId) {
//     // TODO: implement getArticles
//     throw UnimplementedError();
//     // u should get articles list from cache
//   }
//
// }