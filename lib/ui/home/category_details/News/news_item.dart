import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/utils/app_colors.dart';

class NewsItem extends StatelessWidget {
  News news;
   NewsItem({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width*.04),
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
              Text(news.publishedAt??'',
              style: Theme.of(context).textTheme.labelSmall,)
            ],
          )
        ],
      ) ,
    );
  }
}
