
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_style.dart';
import 'package:news_app/core/utils/di.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/presentation/screens/home/tabs/articles/viewModel/articles_viewModel.dart';
import 'package:provider/provider.dart';

import '../../../common/base_state.dart';
import '../../../core/utils/colors_manager.dart';
import '../../../core/widgets/loading_widget.dart';
import '../../../core/widgets/ui_error_widget.dart';
import '../home/tabs/articles/widgets/article_item.dart';

class NewsSearch extends SearchDelegate{
  var viewModel = ArticlesViewModel(articlesUseCase: getArticlesUseCase());

  @override
  ThemeData appBarTheme(BuildContext context){
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: ColorsManager.green,
        titleTextStyle: AppStyle.appBar,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(22.r))
        )
      )
    );
  }
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () {
      close(context, null);
      },
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white,));
  }

  @override
  Widget buildResults(BuildContext context) {
    viewModel.searchInArticle(query);
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<ArticlesViewModel>(
        builder: (context, viewModel, child) {
          var state = viewModel.state;
          switch (state) {
            case SuccessState():
              List<ArticleEntity> articles = state.date;
              if(articles==null){
                return const Center(
                    child: Text('no result found'));
              }else{
                return Expanded(
                  child: ListView.builder(
                    itemCount: articles.length,
                    itemBuilder: (context, index) =>
                        ArticleItem(article: articles[index]),
                  ),
                );
              }

            case ErrorState():
                if(state.error==null|| state.serverError==null){
                return const Center(
                    child: Text('no result found'));
              } else{
                return
                  UiErrorWidget(
                    error: state.error,
                    serverError: state.serverError,
                  );}
            case LoadingState():
              return const LoadingWidget();
          }
        },
      ),
    );

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    viewModel.searchInArticle(query);
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
              if(state.error==null|| state.serverError==null){
                return const Center(
                    child: Text('no result found'));
              } else{
              return
                UiErrorWidget(
                error: state.error,
                serverError: state.serverError,
              );}
            case LoadingState():
              return const LoadingWidget();
          }
        },
      ),
    );
    // return FutureBuilder(
    //   future: viewModel.execute(query),
    //   builder: (context, snapshot) {
    //   if(snapshot.connectionState==ConnectionState.waiting){
    //     return const Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   }
    //   if(snapshot.hasError|| snapshot.data==null){
    //     return  Center(
    //       child: Text('${snapshot.error}'),
    //     );
    //   }
    //
    //   var result = snapshot.data ;
    //   if(result==null){
    //     return const Center(
    //       child: Text('no result found'));
    //   }
    //   return ListView.builder(
    //     itemBuilder: (context, index) =>
    //      ArticleItem(article: result[index]),
    //     itemCount: result.length ,
    //   );
    // },);
  }

}