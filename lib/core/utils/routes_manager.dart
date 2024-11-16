import 'package:flutter/material.dart';
import 'package:news_app/presentation/screens/home/home.dart';
import 'package:news_app/presentation/screens/splash/splash.dart';

class RoutesManager{
  static const String splash='/splash';
  static const String home='/home';

  static Map<String,WidgetBuilder> routes={
    splash:(_)=> const Splash(),
    home:(_)=> const Home(),
  };
}