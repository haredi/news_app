import 'package:flutter/material.dart';
import 'package:news_app/core/utils/dependency.dart';
import 'package:news_app/core/utils/di.dart';
import 'package:news_app/core/widgets/loading_widget.dart';
import 'package:news_app/core/widgets/ui_error_widget.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/data_source_impl/articles_datasource_impl.dart';
import 'package:news_app/data/model/articles_response/article.dart';
import 'package:news_app/data/model/sources_response/source.dart';
import 'package:news_app/data/repository_impl/articles_repository_impl.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/domain/entities/sources_entity.dart';
import 'package:provider/provider.dart';

import '../../../../../../common/base_state.dart';
import '../viewModel/articles_viewModel.dart';
import '../widgets/article_item.dart';

class ArticlesView extends StatefulWidget {
  ArticlesView({super.key, required this.source});
  SourceEntity source;

  @override
  State<ArticlesView> createState() => _ArticlesViewState();
}

class _ArticlesViewState extends State<ArticlesView> {
  var viewModel = getIt<ArticlesViewModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id!);
  }

  @override
  void didUpdateWidget(covariant ArticlesView oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (oldWidget.source.id != widget.source.id) {
      viewModel.getNewsBySourceId(widget.source.id!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<ArticlesViewModel>(
        builder: (context, viewModel, child) {
          var state = viewModel.state;
          switch (state) {
            case SuccessState():
              List<ArticleEntity> articles = state.date;
              return Expanded(
                child: ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) =>
                      ArticleItem(article: articles[index]),
                ),
              );
            case ErrorState():
              return UiErrorWidget(
                error: state.error,
                serverError: state.serverError,
              );
            case LoadingState():
              return const LoadingWidget();
          }
        },
      ),
    );
  }
}

// return FutureBuilder(future: ApiManager.getArticles(source.id??''),
//     builder: (context, snapshot) {
//       if (snapshot.connectionState==ConnectionState.waiting) {
//         return const Center(child: CircularProgressIndicator());
//       }
//       if(snapshot.data?.status=='error'||snapshot.hasError){
//         return Text(snapshot.data?.message ?? 'checked internet connection');
//       }
//        List<Article> articles= snapshot.data?.articles ??[];
//       return Expanded(
//         child: ListView.builder(
//           itemCount: articles.length,
//           itemBuilder: (context, index) => ArticleItemWidget(article: articles[index]),),
//       );
//     },
// );
