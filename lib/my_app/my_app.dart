import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_theme.dart';
import 'package:news_app/core/utils/assets_manager.dart';
import 'package:news_app/core/utils/routes_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: RoutesManager.routes,
        initialRoute: RoutesManager.splash,
         theme: AppTheme.light,
        themeMode: ThemeMode.light,
      ),
    );
  }
}
