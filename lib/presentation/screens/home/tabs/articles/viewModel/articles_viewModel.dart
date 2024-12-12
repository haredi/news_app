import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/model/articles_response/article.dart';

class ArticlesViewModel extends ChangeNotifier{
  List<Article>? articles;
  String? errorMessage;
  bool isLoading=false;

  void getNewsBySourceId(String sourceId)async{

      isLoading=true;
      notifyListeners();
      var response=await ApiManager.getArticles(sourceId);
      isLoading=false;
    return response.fold(
          (articles) {
      this.articles=articles;
    },
          (error) {
      errorMessage=error;
    },);


    notifyListeners();
  }
}