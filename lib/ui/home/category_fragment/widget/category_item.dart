import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/utils/app_colors.dart';

class CategoryItem extends StatelessWidget {
  Category category;
  int index;
   CategoryItem({super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return
      Stack(
        alignment: (index % 2 == 0)?Alignment.bottomRight:Alignment.bottomLeft,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(category.image),
          ),
          Container(
            padding: EdgeInsetsDirectional.only(
              start:(index % 2 == 0)? width*0.03:0,
              end: (index % 2 == 0)? 0:width*0.03
            ),
            margin: EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.02),
            width: width*0.45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(84),
              color: AppColors.greyColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection:(index % 2 == 0)?TextDirection.ltr:TextDirection.rtl ,
              children: [
                Text(AppLocalizations.of(context)!.view_all,
                style: Theme.of(context).textTheme.headlineMedium,),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Icon(
                    (index % 2 == 0)?Icons.arrow_forward_ios_rounded:Icons.arrow_back_ios_rounded,
                  color: Theme.of(context).dividerColor,),
                )

              ],
            ),
          )
        ],
      );
  }
}
