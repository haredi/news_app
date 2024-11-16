import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/app_style.dart';
import 'package:news_app/data_model/category_DM/category_DM.dart';

class CategoryWidget extends StatelessWidget {
  CategoryDM categoryDM;
  int index;
   CategoryWidget({super.key, required this.categoryDM, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: categoryDM.bgColor ,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
          bottomLeft: Radius.circular(index.isEven? 25.r:0),
          bottomRight: Radius.circular(index.isOdd? 25.r:0),
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(categoryDM.imagePath,width: 142.w, height: 126.h,),
          Text(categoryDM.title, style: AppStyle.categoryTitle,),
        ],
      ),
    );
  }
}
