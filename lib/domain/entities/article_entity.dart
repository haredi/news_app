import 'package:news_app/domain/entities/sources_entity.dart';

class ArticleEntity{
  String? title;
  SourceEntity? source;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  ArticleEntity(
      {
        this.title,
        this.source,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});
}