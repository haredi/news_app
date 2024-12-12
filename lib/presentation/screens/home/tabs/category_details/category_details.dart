import 'package:flutter/material.dart';
import 'package:news_app/data_model/category_DM/category_DM.dart';
import 'package:news_app/presentation/screens/home/tabs/sources/view/sources_view.dart';

class CategoryDetails extends StatelessWidget {
  CategoryDetails({super.key, required this.categoryDM});
  CategoryDM categoryDM;

  @override
  Widget build(BuildContext context) {

    return SourcesView(categoryDM: categoryDM);
  }
}


// return FutureBuilder(
//   future: ApiManager.getSources(categoryDM.id),
//   builder: (context, snapshot) {
//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return const Center(child: CircularProgressIndicator());
//     }
//     if (snapshot.data?.status == 'error' || snapshot.hasError) {
//       return Text(snapshot.data?.message ?? snapshot.hasError.toString());
//     }
//     List<Source> sources = snapshot.data?.sources ??[];
//     return SourcesWidget(sources: sources,);
//   },
// );
