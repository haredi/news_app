import 'package:flutter/material.dart';
import 'package:news_app/core/utils/di.dart';
import 'package:news_app/core/widgets/loading_widget.dart';
import 'package:news_app/core/widgets/ui_error_widget.dart';
import 'package:news_app/data_model/category_DM/category_DM.dart';
import 'package:news_app/presentation/screens/home/tabs/sources/viewModel/sources_viewModel.dart';
import 'package:provider/provider.dart';

import '../../../../../../common/base_state.dart';
import '../../../../../../data/model/sources_response/source.dart';
import '../widget/sources_tab.dart';

class SourcesView extends StatefulWidget {
 final CategoryDM categoryDM;
  const SourcesView({super.key, required this.categoryDM});

  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView> {
  var viewModel=SourcesViewModel(sourcesUseCase: getSourcesUseCase());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSourcesByCategoryId(widget.categoryDM.id);
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<SourcesViewModel>(
        builder: (context, viewModel, child) {
          var state=viewModel.state;
        switch(state){
          case LoadingState():
            return const LoadingWidget();
          case SuccessState():
            return SourcesTab(sources: state.date );
          case ErrorState():
            return UiErrorWidget(serverError: state.serverError,error: state.error,);
        }
        },),
    );
  }
}

// if(viewModel.isLoading){
//   return const Center(
//     child: CircularProgressIndicator(),
//   );
// }
// if(viewModel.errorMessage!=null){
//   return Text(viewModel.errorMessage!);
// }
// List<Source> sources=viewModel.sources!;
// return SourcesTab(sources: sources);