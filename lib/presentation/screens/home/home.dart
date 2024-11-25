import 'package:flutter/material.dart';
import 'package:news_app/core/utils/assets_manager.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/strings_manager.dart';
import 'package:news_app/data_model/category_DM/category_DM.dart';
import 'package:news_app/presentation/screens/home/home_drawer/home_drawer.dart';
import 'package:news_app/presentation/screens/home/tabs/categories_tab/categories_tab.dart';
import 'package:news_app/presentation/screens/home/tabs/category_details/category_details.dart';
import 'package:news_app/presentation/screens/home/tabs/settings_tab/settings_tab.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Widget selectedWidget;
  String title=StringsManager.appTitle;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedWidget = CategoriesTab(
      onCategoryItemClicked: onCategoryItemClicked,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(
          color: ColorsManager.white,
          image: DecorationImage(
              image: AssetImage(AssetsManager.pattern), fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        drawer: HomeDrawer(onDrawerItemClicked: onDrawerItemClicked),
        body: selectedWidget,
      ),
    );
  }

  void onCategoryItemClicked(CategoryDM category) {
    selectedWidget = CategoryDetails(categoryDM: category,);
    title=category.title;
    setState(() {});
  }

  void onDrawerItemClicked(MenuItem item) {
    switch (item) {
      case MenuItem.categories:
        {
          title=StringsManager.appTitle;
          selectedWidget = CategoriesTab(
            onCategoryItemClicked: onCategoryItemClicked,
          );
        }
      case MenuItem.settings:
        {
          title='Settings';
          selectedWidget = const SettingsTab();
        }
    }
    Navigator.pop(context);
    setState(() {});
  }
}
