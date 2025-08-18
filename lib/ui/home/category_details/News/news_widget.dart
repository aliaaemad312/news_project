import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/ui/home/category_details/News/news_item.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:provider/provider.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../providers/app_language_provider.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class NewsWidget extends StatefulWidget {
  final Source source;
  const NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  static const pageSize = 10;

  final PagingController<int, News> pagingController =
  PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
  }

  Future<void> fetchPage(int pageKey) async {
    try {
      var languageProvider =
      Provider.of<AppLanguageProvider>(context, listen: false);

      final response = await ApiManager.getNewsBySourceId(
        widget.source.id ?? '',
        languageProvider.appLanguage,
        pageKey,
        pageSize,
      );

      final newItems = response?.articles ?? [];

      final isLastPage = newItems.length < pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PagedListView<int, News>(
        pagingController: pagingController,
        builderDelegate: PagedChildBuilderDelegate<News>(
          itemBuilder: (context, item, index) => NewsItem(news: item),
          firstPageProgressIndicatorBuilder: (_) =>
          const Center(child: CircularProgressIndicator()),
          newPageProgressIndicatorBuilder: (_) =>
          const Center(child: CircularProgressIndicator()),
          firstPageErrorIndicatorBuilder: (_) =>
          const Center(child: Text("Error loading news")),
        ),
      ),
    );
  }
}



/*class NewsWidget extends StatefulWidget {
  Source source;
   NewsWidget({super.key,required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var languageProvider=Provider.of<AppLanguageProvider>(context);
    return FutureBuilder<NewsResponse?>(
        future: ApiManager.getNewsBySourceId(widget.source.id??'',languageProvider.appLanguage,1,20),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.greyColor,
              ),
            );
          }else if(snapshot.hasError){
           return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppLocalizations.of(context)!.something_went_wrong,
                    style: Theme.of(context).textTheme.labelMedium,),
                  SizedBox(height: 8,),
                  ElevatedButton(
                      onPressed: () {
                        ApiManager.getNewsBySourceId(widget.source.id??'',languageProvider.appLanguage,1,20);
                        setState(() {

                        });
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.greyColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      child: Text(AppLocalizations.of(context)!.try_again,
                        style: Theme.of(context).textTheme.labelMedium,))
                ],
              ),
            );
          }
          if(snapshot.data?.status !='ok'){
            return  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(snapshot.data!.message!,
                  style: Theme.of(context).textTheme.labelMedium,),
                SizedBox(height: 8,),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getSources(widget.source.category!);
                      setState(() {

                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.greyColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                    child: Text(AppLocalizations.of(context)!.try_again,
                      style: Theme.of(context).textTheme.labelMedium,))
              ],
            );
          }
          var newsList=snapshot.data?.articles??[];
          return Expanded(
            child: ListView.separated(
              separatorBuilder:(context, index) {
                return SizedBox(height: height*.02,);
              } ,
              itemBuilder: (context, index) {
                return NewsItem(news: newsList[index]);
              },
              itemCount: newsList.length,),
          );
        },
    );
  }
}*/