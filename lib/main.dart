import 'package:flutter/material.dart';
import 'package:news_app/ui/home/home_screen.dart';
import 'package:news_app/utils/app_routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app/l10n/app_localizations.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale('en'),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeRouteName,
      routes: {
        AppRoutes.homeRouteName:(context)=>HomeScreen(),
      },
    );
  }
}
