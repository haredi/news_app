import 'package:flutter/material.dart';
import 'package:news_app/data/model/sources_response/source.dart';
import 'package:news_app/presentation/screens/home/tabs/articles/view/articles_view.dart';
import 'package:news_app/presentation/screens/home/tabs/sources/widget/source__item.dart';

class SourcesWidget extends StatefulWidget {
  SourcesWidget({super.key, required this.sources,});
  List<Source> sources;

  @override
  State<SourcesWidget> createState() => _SourcesWidgetState();
}

class _SourcesWidgetState extends State<SourcesWidget> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
              onTap: (index) {
                selectedIndex=index;
                setState(() {
                });
              },
                tabAlignment: TabAlignment.start,
                labelPadding: EdgeInsets.all(8),
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                isScrollable: true,
                tabs: widget.sources
                    .map(
                      (source) => SourceItem(
                        source: source,
                        isSelected: widget.sources.indexOf(source)==selectedIndex,
                      ),
                    )
                    .toList())),
        ArticlesView(source: widget.sources[selectedIndex],)
      ],
    );
  }
}
