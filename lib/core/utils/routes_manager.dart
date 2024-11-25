import 'package:flutter/material.dart';
import 'package:news_app/presentation/screens/article_details/article_details.dart';
import 'package:news_app/presentation/screens/home/home.dart';
import 'package:news_app/presentation/screens/splash/splash.dart';

class RoutesManager{
  static const String splash='/splash';
  static const String home='/home';
  static const String articleDetails='/articleDetails';

  static Map<String,WidgetBuilder> routes={
    splash:(_)=> const Splash(),
    home:(_)=> const Home(),
    articleDetails:(_)=> const ArticleDetails(),
  };
}