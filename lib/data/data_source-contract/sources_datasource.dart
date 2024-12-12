import 'package:news_app/data/model/sources_response/source.dart';
import 'package:news_app/result.dart';

abstract class SourcesDatasource{
  Future<Result<List<Source>>> getSources(String categoryId);
}