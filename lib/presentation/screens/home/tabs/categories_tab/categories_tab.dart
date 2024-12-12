import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_style.dart';
import 'package:news_app/data_model/category_DM/category_DM.dart';
import 'package:news_app/presentation/screens/home/tabs/categories_tab/widgets/category_widget.dart';

typedef OnCategoryItemClicked = void Function(CategoryDM);

class CategoriesTab extends StatelessWidget {
  CategoriesTab({super.key, required this.onCategoryItemClicked});
  OnCategoryItemClicked onCategoryItemClicked;
  List<CategoryDM> categoriesList = CategoryDM.getAllCategories();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pick your category\nof interest',
              style: AppStyle.pickCategories),
          Expanded(
              child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20.h,
                crossAxisSpacing: 25.w),
            itemBuilder: (context, index) =>
                InkWell(
                onTap: () {
                  onCategoryItemClicked(categoriesList[index] );
                },
                child: CategoryWidget(
                  categoryDM: categoriesList[index],
                  index: index,
                )),
            itemCount: categoriesList.length,
          ))
        ],
      ),
    );
  }
}
