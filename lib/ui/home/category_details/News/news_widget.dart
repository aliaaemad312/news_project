import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/ui/home/category_details/News/news_item.dart';
import 'package:news_app/utils/app_colors.dart';

import '../../../../l10n/app_localizations.dart';

class NewsWidget extends StatefulWidget {
  Source source;
   NewsWidget({super.key,required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    return FutureBuilder<NewsResponse?>(
        future: ApiManager.getNewsBySourceId(widget.source.id??''),
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
                        ApiManager.getNewsBySourceId(widget.source.id??'');
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
                      ApiManager.getSources();
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
}
