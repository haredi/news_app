import 'package:flutter/material.dart';
import 'package:news_app/data/model/sources_response/source.dart';
import 'package:news_app/domain/entities/sources_entity.dart';
import 'package:news_app/presentation/screens/home/tabs/articles/view/articles_view.dart';
import 'package:news_app/presentation/screens/home/tabs/sources/widget/source__item.dart';

class SourcesTab extends StatefulWidget {
  SourcesTab({super.key, required this.sources,});
  List<SourceEntity> sources;

  @override
  State<SourcesTab> createState() => _SourcesTabState();
}

class _SourcesTabState extends State<SourcesTab> {
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
