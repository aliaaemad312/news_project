import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/ui/home/category_details/News/widget/news_bottom_sheet.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_routes.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class NewsItem extends StatelessWidget {
  News news;
   NewsItem({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    var timeAgo = DateTime.parse(news.publishedAt!).subtract(Duration(minutes: 15));
    return InkWell(
      onTap: (){
        showModalBottomSheet(context: context,
            backgroundColor: Theme.of(context).dividerColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
            ),

            builder: (context) {
              return Padding(
                padding:  EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.01),
                child: Column(
                    children: [
                ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: news.urlToImage??'',
                  placeholder: (context, url) => Center(child: CircularProgressIndicator(color: AppColors.greyColor,)),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),

                              ),
                              SizedBox(height: height*0.01,),
                              Text(news.content??'',
                              style: Theme.of(context).textTheme.bodyLarge,),
                              SizedBox(height: height*0.02,),
                              ElevatedButton(
                  onPressed: ()async {
                    final Uri url = Uri.parse(news.url ?? '');
                    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                      throw Exception('Could not launch $url');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                    )
                  ),
                               child: Text(AppLocalizations.of(context)!.view_full_article,
                               style: Theme.of(context).textTheme.labelLarge,)
                              ),
                              ]),
              );
            },
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: width*.04, vertical: height*0.01),
        padding: EdgeInsets.symmetric(horizontal: width*.02,vertical: width*.02),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(context).dividerColor,
            width: 1
          )
        ),
        child:Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage??'',
                placeholder: (context, url) => Center(child: CircularProgressIndicator(color: AppColors.greyColor,)),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),

            ),
            SizedBox(height: height*0.01,),
            Text(news.title??'',
            style: Theme.of(context).textTheme.labelLarge,),
            SizedBox(height: height*0.01,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text('By: ${news.author??''}',
                  style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                Text(timeago.format(timeAgo)??'',
                style: Theme.of(context).textTheme.labelSmall,)
              ],
            )
          ],
        ) ,
      ),
    );
  }
}


