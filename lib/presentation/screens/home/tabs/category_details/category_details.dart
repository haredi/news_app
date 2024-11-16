import 'package:flutter/material.dart';
import 'package:news_app/data_model/category_DM/category_DM.dart';

class CategoryDetails extends StatelessWidget {
   CategoryDetails({super.key, required this.categoryDM});
CategoryDM categoryDM;
  @override
  Widget build(BuildContext context) {
    return Container(
color: Colors.blue,
      child: Text(categoryDM.id),
    );
  }
}
