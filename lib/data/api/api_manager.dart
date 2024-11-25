import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/data/model/articles_response/articles_response.dart';
import 'package:news_app/data/model/sources_response/sources_response.dart';

//https://newsapi.org/v2/top-headlines/sources?apiKey=
class ApiManager {
  static const String _baseUrl = 'newsapi.org';
  static const String _sourcesEndPoint = '/v2/top-headlines/sources';
  static const String _articleEndPoint = '/v2/everything';
  static const String _apiKey = '2edca7de856d4e199522153bb864bc1e';

  static Future<SourcesResponse> getSources(String categoryId) async {
    Uri url = Uri.https(_baseUrl, _sourcesEndPoint, {
      "apiKey": _apiKey,
      "category": categoryId,
    });
    http.Response serverResponse = await http.get(url);
    var json = jsonDecode(serverResponse.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse;
  }

  static Future<ArticlesResponse> getArticles(String sourceId) async {
    Uri url = Uri.https(
        _baseUrl, _articleEndPoint, {"apiKey": _apiKey, "sources": sourceId});
    http.Response serverResponse = await http.get(url);
    var json = jsonDecode(serverResponse.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    return articlesResponse;
  }
}
