import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/model/articles_response/article.dart';
import 'package:news_app/data/model/sources_response/source.dart';
import 'package:news_app/presentation/screens/home/tabs/news/article_item_widget.dart';

class ArticlesListWidget extends StatelessWidget {
   ArticlesListWidget({super.key, required this.source});
Source source;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: ApiManager.getArticles(source.id??''), 
        builder: (context, snapshot) {
          if (snapshot.connectionState==ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if(snapshot.data?.status=='error'||snapshot.hasError){
            return Text(snapshot.data?.message ?? 'checked internet connection');
          }
           List<Article> articles= snapshot.data?.articles ??[];
          return Expanded(
            child: ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) => ArticleItemWidget(article: articles[index]),),
          );
        },
    );
  }
}
