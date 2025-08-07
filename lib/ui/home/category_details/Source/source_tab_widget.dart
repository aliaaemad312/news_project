import 'package:flutter/material.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/ui/home/category_details/News/news_widget.dart';
import 'package:news_app/ui/home/category_details/Source/source_name.dart';
import 'package:news_app/utils/app_colors.dart';

class SourceTabWidget extends StatefulWidget {
  List<Source>sourcesList;

   SourceTabWidget({super.key, required this.sourcesList});

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return DefaultTabController(
        length: widget.sourcesList.length,
        child: Column(
          children: [
            TabBar(
              onTap: (index) {
                selectedIndex=index;
                setState(() {

                });

              },
                isScrollable: true,
                indicatorColor: Theme.of(context).dividerColor,
                labelPadding: EdgeInsets.symmetric(horizontal: width*0.02),
                dividerColor: AppColors.transparentColor,
                tabAlignment: TabAlignment.start,
                tabs: widget.sourcesList.map((source) {
              return SourceName(source: source,
                isSelected: selectedIndex==widget.sourcesList.indexOf(source),
              );
            },).toList()),
            NewsWidget(source: widget.sourcesList[selectedIndex])
          ],
        )
    );
  }
}
