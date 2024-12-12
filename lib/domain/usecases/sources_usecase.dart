import 'package:news_app/domain/repository_contract/sources_repo_contract.dart';

import '../../result.dart';
import '../entities/sources_entity.dart';

class GetSourcesUseCase{
  SourcesRepository repository;
  GetSourcesUseCase({required this.repository});
  Future<Result<List<SourceEntity>>> execute(String categoryId){
    return repository.getSources(categoryId);
  }
}