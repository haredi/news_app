import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/data/model/articles_response/article.dart';
import 'package:news_app/data/model/articles_response/articles_response.dart';
import 'package:news_app/data/model/sources_response/source.dart';
import 'package:news_app/data/model/sources_response/sources_response.dart';
import 'package:news_app/result.dart';

//https://newsapi.org/v2/top-headlines/sources?apiKey=
class ApiManager {
  static const String _baseUrl = 'newsapi.org';
  static const String _sourcesEndPoint = '/v2/top-headlines/sources';
  static const String _articleEndPoint = '/v2/everything';
  static const String _apiKey = '2edca7de856d4e199522153bb864bc1e';

   Future<Result<List<Source>>> getSources(
      String categoryId) async {
    Uri url = Uri.https(_baseUrl, _sourcesEndPoint, {
      "apiKey": _apiKey,
      "category": categoryId,
    });

    try {
      http.Response serverResponse = await http.get(url);
      var json = jsonDecode(serverResponse.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      if (sourcesResponse.status == 'ok') {
        return Success(data: sourcesResponse.sources!);
      } else {
        return ServerError(message: sourcesResponse.message!, code: sourcesResponse.code!);
      }
    } on Exception catch (e) {
      return Error(exception: e);
    }
  }

   Future<Result<List<Article>>> getArticles(String sourceId, ) async {
    Uri url = Uri.https(_baseUrl, _articleEndPoint, {
      "apiKey": _apiKey,
      "sources": sourceId,
    });
    try{
      http.Response serverResponse = await http.get(url);
      var json = jsonDecode(serverResponse.body);
      ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
      if(articlesResponse.status=='ok'){
        return Success(data: articlesResponse.articles!);
      }else{
        return ServerError( message: articlesResponse.message!, code: articlesResponse.code!);
      }
    }on Exception catch(e){
      return Error(exception: e);
    }
  }

   Future<Result<List<Article>>> searchInArticles(String query) async {
    Uri url = Uri.https(_baseUrl, _articleEndPoint, {
      "apiKey": _apiKey,
      "q": query,
    });
    try{
      http.Response serverResponse = await http.get(url);
      var json = jsonDecode(serverResponse.body);
      ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
      if(articlesResponse.status=='ok'){
        return Success(data: articlesResponse.articles!);
      }else{
        return ServerError( message: articlesResponse.message!, code: articlesResponse.code!);
      }
    }on Exception catch(e){
      return Error(exception: e);
    }
  }
}
