import 'package:flutter/material.dart';
import 'package:news_app/ui/home/category_details/News/widget/news_bottom_sheet.dart';
import 'package:news_app/ui/home/search/search_news.dart';
import 'package:news_app/utils/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:news_app/providers/app_language_provider.dart';
import 'package:news_app/providers/app_theme_provider.dart';
import 'package:news_app/ui/home/home_screen.dart';
import 'package:news_app/utils/app_routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app/l10n/app_localizations.dart';

void main(){
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AppLanguageProvider(),),
    ChangeNotifierProvider(create: (context) => AppThemeProvider(),),

  ],

      child:MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider=Provider.of<AppLanguageProvider>(context);
    var themeProvider=Provider.of<AppThemeProvider>(context);

    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(languageProvider.appLanguage),
      themeMode:themeProvider.appTheme ,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,

      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeRouteName,
      routes: {
        AppRoutes.homeRouteName:(context)=>HomeScreen(),
        AppRoutes.searchNewsRouteName:(context)=>SearchNews(),
      },
    );
  }
}
