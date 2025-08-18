import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/utils/app_assets.dart';
import 'package:provider/provider.dart';

import '../../../providers/app_theme_provider.dart';
import '../../../utils/app_colors.dart';
import '../category_details/News/news_item.dart';

class SearchNews extends StatefulWidget {
   SearchNews({super.key });

  @override
  State<SearchNews> createState() => _SearchNewsState();
}

class _SearchNewsState extends State<SearchNews> {
  TextEditingController controller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    var themeProvider=Provider.of<AppThemeProvider>(context);
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body:Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width*0.04),
              child: TextField(
                cursorColor: Theme.of(context).dividerColor,
                style: Theme.of(context).textTheme.headlineLarge,
                controller: controller,
                onChanged: (value) {
                  ApiManager.searchNews(value);
                  setState(() {

                  });
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Theme.of(context).dividerColor
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                          color: Theme.of(context).dividerColor
                      )
                  ),
                  hintText: AppLocalizations.of(context)!.search,
                  hintStyle: Theme.of(context).textTheme.headlineLarge,
                  suffixIcon: themeProvider.isDarkMode()? InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                      child: Image.asset(AppAssets.closeIconDark)):
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                      child: Image.asset(AppAssets.closeIconLight)),
                  prefixIcon: themeProvider.isDarkMode()? Image.asset(AppAssets.searchIconDark):
                  Image.asset(AppAssets.searchIconLight)
                ),
              ),
            ),
            SizedBox(height: height*0.02,),
            Expanded(
              child: controller.text.isEmpty? Center(
                child: Text('No News To Show Yet',
                style: TextStyle(
                  color: AppColors.whiteColor
                ),),
              ): FutureBuilder(
                  future: ApiManager.searchNews(controller.text),
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
                                  ApiManager.searchNews(controller.text);
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
                                ApiManager.searchNews(controller.text);
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
              ),
            )
          ],
        ) ,
      ),
    );
  }
}
