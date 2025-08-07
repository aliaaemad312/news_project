import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/providers/app_language_provider.dart';
import 'package:news_app/providers/app_theme_provider.dart';
import 'package:news_app/ui/home/category_details/category_details.dart';
import 'package:news_app/utils/app_assets.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:news_app/utils/app_theme.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    var themeProvider=Provider.of<AppThemeProvider>(context);
    var languageProvider=Provider.of<AppLanguageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.home,
        style: Theme.of(context).textTheme.headlineLarge),
      ),
      drawer: Drawer(
        backgroundColor: AppColors.blackColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: AppColors.whiteColor),
                child: Center(
                  child: Text(AppLocalizations.of(context)!.news_app,
                  style: AppStyles.bold24Black,),
                )
            ),
            ListTile(
              leading: Image.asset(AppAssets.homeIcon),
              title: Text(AppLocalizations.of(context)!.go_to_home,
                style: AppStyles.bold20White,),
            ),
            Divider(color: AppColors.whiteColor,
            indent: width*.07,
              endIndent: width*.07,),
            ListTile(
              leading: Image.asset(AppAssets.themeIcon),
              title: Text(AppLocalizations.of(context)!.theme,
                style: AppStyles.bold20White,),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: width*0.03),
              padding: EdgeInsets.symmetric(horizontal: width*0.03),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.whiteColor),
                borderRadius: BorderRadius.circular(16)
              ),
              child: DropdownButton<String>(
                underline: SizedBox(),
                isExpanded: true,
                iconEnabledColor: AppColors.whiteColor,
                items: <String>[AppLocalizations.of(context)!.dark,
                  AppLocalizations.of(context)!.light].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {
                  themeProvider.changeTheme(themeProvider.appTheme);
                },
              ),
            )
          ],
        ),
      ),
      body: CategoryDetails(),

    );
  }
}


//c380ceb571f3439babd1d913340a8f81