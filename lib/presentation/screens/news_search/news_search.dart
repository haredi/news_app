import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/model/articles_response/article.dart';
import 'package:news_app/data/model/articles_response/articles_response.dart';
import 'package:news_app/presentation/screens/home/tabs/news/article_item_widget.dart';

import '../../../core/utils/colors_manager.dart';

class NewsSearch extends SearchDelegate{
  @override
  ThemeData appBarTheme(BuildContext context){
    return ThemeData(
      appBarTheme:const AppBarTheme(
        backgroundColor: ColorsManager.green,
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
        icon: Icon(Icons.arrow_back_ios_new, color: Colors.white,));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.searchInArticles(query),
      builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if(snapshot.hasError|| snapshot.data==null){
          return  Center(
            child: Text('${snapshot.error}'),
          );
        }

        var articlesResponse = snapshot.data as ArticlesResponse ;
        if(articlesResponse.articles==null){
          return const Center(
              child: Text('no result found'));
        }
        return ListView.builder(
          itemBuilder: (context, index) =>
              ArticleItemWidget(article: articlesResponse.articles![index]),
          itemCount: articlesResponse.articles?.length ?? 0 ,
        );
      },);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.searchInArticles(query),
      builder: (context, snapshot) {
      if(snapshot.connectionState==ConnectionState.waiting){
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if(snapshot.hasError|| snapshot.data==null){
        return  Center(
          child: Text('${snapshot.error}'),
        );
      }

      var articlesResponse = snapshot.data as ArticlesResponse ;
      if(articlesResponse.articles==null){
        return const Center(
          child: Text('no result found'));
      }
      return ListView.builder(
        itemBuilder: (context, index) =>
         ArticleItemWidget(article: articlesResponse.articles![index]),
        itemCount: articlesResponse.articles?.length ?? 0 ,
      );
    },);
  }

}