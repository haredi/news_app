import 'package:injectable/injectable.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/data_source-contract/sources_datasource.dart';
import 'package:news_app/data/model/sources_response/source.dart';
import 'package:news_app/result.dart';
@Injectable(as: SourcesDatasource)
class SourcesApiDatasourceImpl extends SourcesDatasource{
  ApiManager apiManager;
  @factoryMethod
  SourcesApiDatasourceImpl({required this.apiManager});

  @override
  Future<Result<List<Source>>> getSources(String categoryId) async{
    var result= await apiManager.getSources(categoryId);
    switch(result){
      case Success<List<Source>>():
        return Success(data: result.data);
      case ServerError<List<Source>>():
        return ServerError(message: result.message, code: result.code);
      case Error<List<Source>>():
        return Error(exception: result.exception);
    }
  }


}