import 'package:news_app/data/model/sources_response/source.dart';
import 'package:news_app/domain/entities/sources_entity.dart';
import 'package:news_app/result.dart';

import '../../domain/repository_contract/sources_repo_contract.dart';
import '../data_source-contract/sources_datasource.dart';

class SourcesRepositoryImpl extends SourcesRepository {
  SourcesDatasource datasource;
  SourcesRepositoryImpl({required this.datasource});
  @override
  Future<Result<List<SourceEntity>>> getSources(String categoryId) async {
    var result = await datasource.getSources(categoryId);
    switch (result) {
      case Success<List<Source>>():
        {
          return Success(
              data: result.data.map(
                  (source) => source.toSourceEntity())
                  .toList()
          );
        }
      case ServerError<List<Source>>():
       {
        return ServerError(message: result.message, code: result.code);
       }
      case Error<List<Source>>():
       {
        return Error(exception: result.exception);
       }
    }
  }
}
