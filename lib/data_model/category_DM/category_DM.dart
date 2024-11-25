import 'package:flutter/material.dart';
import 'package:news_app/core/utils/assets_manager.dart';
import 'package:news_app/core/utils/colors_manager.dart';
import 'package:news_app/core/utils/constants_manager.dart';
import 'package:news_app/core/utils/strings_manager.dart';

class CategoryDM{
  String id;
  String title;
  Color bgColor;
  String imagePath;
  CategoryDM({
    required this.id,
    required this.title,
    required this.bgColor,
    required this.imagePath,
  });
  
  static List<CategoryDM> getAllCategories()=>[
    CategoryDM(id: ConstantsManager.sportsBackEndId, title: StringsManager.sports, bgColor: ColorsManager.red, imagePath: AssetsManager.sports),
    CategoryDM(id: ConstantsManager.generalBackEndId, title: StringsManager.general, bgColor: ColorsManager.darkBlue, imagePath: AssetsManager.general),
    CategoryDM(id: ConstantsManager.healthBackEndId, title: StringsManager.health, bgColor: ColorsManager.pink, imagePath: AssetsManager.health),
    CategoryDM(id: ConstantsManager.businessBackEndId, title: StringsManager.business, bgColor: ColorsManager.brown, imagePath: AssetsManager.business),
    CategoryDM(id: ConstantsManager.entertainmentBackEndId, title: StringsManager.entertainment, bgColor: ColorsManager.blue, imagePath: AssetsManager.entertainment),
    CategoryDM(id: ConstantsManager.scienceBackEndId, title: StringsManager.science, bgColor: ColorsManager.yellow, imagePath: AssetsManager.science),
    CategoryDM(id: ConstantsManager.techBackEndId, title: StringsManager.technology, bgColor: ColorsManager.darkBlue, imagePath: AssetsManager.technology),
  ];
}