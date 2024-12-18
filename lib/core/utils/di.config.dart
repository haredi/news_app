// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/api/api_manager.dart' as _i442;
import '../../data/data_source-contract/articles_datasource.dart' as _i984;
import '../../data/data_source-contract/sources_datasource.dart' as _i124;
import '../../data/data_source_impl/articles_datasource_impl.dart' as _i98;
import '../../data/data_source_impl/sources_datasource_impl.dart' as _i680;
import '../../data/repository_impl/articles_repository_impl.dart' as _i520;
import '../../data/repository_impl/sources_repository_impl.dart' as _i688;
import '../../domain/repository_contract/articles_repo_contract.dart' as _i1034;
import '../../domain/repository_contract/sources_repo_contract.dart' as _i557;
import '../../domain/usecases/articles_usecase.dart' as _i158;
import '../../domain/usecases/sources_usecase.dart' as _i742;
import '../../presentation/screens/home/tabs/articles/viewModel/articles_viewModel.dart'
    as _i973;
import '../../presentation/screens/home/tabs/sources/viewModel/sources_viewModel.dart'
    as _i26;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i442.ApiManager>(() => _i442.ApiManager());
    gh.factory<_i124.SourcesDatasource>(() =>
        _i680.SourcesApiDatasourceImpl(apiManager: gh<_i442.ApiManager>()));
    gh.factory<_i984.ArticlesDatasource>(() =>
        _i98.ArticlesApiDatasourceImpl(apiManager: gh<_i442.ApiManager>()));
    gh.factory<_i1034.ArticlesRepository>(() => _i520.ArticlesRepositoryImpl(
        datasource: gh<_i984.ArticlesDatasource>()));
    gh.factory<_i557.SourcesRepository>(() =>
        _i688.SourcesRepositoryImpl(datasource: gh<_i124.SourcesDatasource>()));
    gh.factory<_i742.GetSourcesUseCase>(() =>
        _i742.GetSourcesUseCase(repository: gh<_i557.SourcesRepository>()));
    gh.factory<_i26.SourcesViewModel>(() =>
        _i26.SourcesViewModel(sourcesUseCase: gh<_i742.GetSourcesUseCase>()));
    gh.factory<_i158.GetArticlesUseCase>(() =>
        _i158.GetArticlesUseCase(repository: gh<_i1034.ArticlesRepository>()));
    gh.factory<_i973.ArticlesViewModel>(() => _i973.ArticlesViewModel(
        articlesUseCase: gh<_i158.GetArticlesUseCase>()));
    return this;
  }
}
