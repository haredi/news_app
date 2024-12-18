import 'package:injectable/injectable.dart';
import 'package:news_app/common/base_viewModel.dart';
import 'package:news_app/domain/entities/sources_entity.dart';
import 'package:news_app/domain/usecases/sources_usecase.dart';
import 'package:news_app/result.dart';
import '../../../../../../common/base_state.dart';
import '../../../../../../data/api/api_manager.dart';
import '../../../../../../data/model/sources_response/source.dart';
import '../../../../../../domain/repository_contract/sources_repo_contract.dart';
@injectable
class SourcesViewModel extends BaseViewModel<List<SourceEntity>>{
  GetSourcesUseCase sourcesUseCase;
  @factoryMethod
  SourcesViewModel({required this.sourcesUseCase});
  void getSourcesByCategoryId(String categoryId)async{
    emit(LoadingState());
    var result =await sourcesUseCase.execute(categoryId);
    switch(result){
      case Success<List<SourceEntity>>():
        emit(SuccessState(date: result.data));
      case ServerError():
        emit(ErrorState(serverError: result));
      case Error():
        emit(ErrorState(error: result));
    }
    notifyListeners();
  }
}


// sealed class SourcesState{
//
// }
// class SourcesLoadingState extends SourcesState{
//   String? loading;
//   SourcesLoadingState({this.loading});
// }
//
// class SourcesSuccessState extends SourcesState{
//   List<Source> sources;
//   SourcesSuccessState({required this.sources});
// }
//
// class SourcesErrorState extends SourcesState{
//   ServerError? serverError;
//   Error? error;
//   SourcesErrorState({this.serverError, this.error});
// }

