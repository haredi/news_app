import 'package:injectable/injectable.dart';
import 'package:news_app/common/base_state.dart';
import 'package:news_app/common/base_viewModel.dart';
import 'package:news_app/data/model/articles_response/article.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/usecases/articles_usecase.dart';
import 'package:news_app/result.dart';

import '../../../../../../domain/repository_contract/articles_repo_contract.dart';
@injectable
class ArticlesViewModel extends BaseViewModel<List<ArticleEntity>>{
GetArticlesUseCase articlesUseCase;
@factoryMethod
ArticlesViewModel({required this.articlesUseCase});
  void getNewsBySourceId(String sourceId)async{
      var result=await articlesUseCase.execute(sourceId);
      switch(result){
        case Success<List<ArticleEntity>>():
            emit(SuccessState(date: result.data));
        case ServerError():
            emit(ErrorState(serverError: result));
        case Error():
           emit(ErrorState(error: result));
      }

  }

void searchInArticle(String query)async{
  var result=await articlesUseCase.executeSearch(query);
  switch(result){
    case Success<List<ArticleEntity>>():
      emit(SuccessState(date: result.data));
    case ServerError():
      emit(ErrorState(serverError: result));
    case Error():
      emit(ErrorState(error: result));
  }

}
}

// sealed class ArticlesState{}
//
// class ArticlesSuccessState extends ArticlesState{
//   List<Article> articles;
//   ArticlesSuccessState({required this.articles});
// }
//
// class ArticleErrorState extends ArticlesState{
//   ServerError? serverError;
//   Error? error;
//   ArticleErrorState({this.serverError, this.error});
// }
//
// class ArticlesLoadingState extends ArticlesState{
//
// }