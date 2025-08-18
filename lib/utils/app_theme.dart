import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';

class AppTheme{
static final ThemeData lightTheme=ThemeData(
  primaryColor: AppColors.whiteColor,
  dividerColor: AppColors.blackColor,
  scaffoldBackgroundColor: AppColors.whiteColor,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.whiteColor,
    iconTheme: IconThemeData(color: AppColors.blackColor),
    centerTitle: true
  ),
  textTheme: TextTheme(
    labelLarge: AppStyles.bold16Black,
    labelMedium: AppStyles.medium14Black,
    bodyLarge: AppStyles.medium14White,
    labelSmall: AppStyles.medium12Grey,
    headlineLarge: AppStyles.medium20Black,
    headlineMedium:AppStyles.medium24Black,
    bodyMedium: AppStyles.medium24White,
  ));

static final ThemeData darkTheme=ThemeData(
    primaryColor: AppColors.blackColor,
    dividerColor: AppColors.whiteColor,
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: AppBarTheme(
        backgroundColor: AppColors.blackColor,
        iconTheme: IconThemeData(color: AppColors.whiteColor),
        centerTitle: true
    ),
    textTheme: TextTheme(
        labelLarge: AppStyles.bold16White,
        labelMedium: AppStyles.medium14White,
        bodyLarge: AppStyles.medium14Black,
        labelSmall: AppStyles.medium12Grey,
        headlineLarge: AppStyles.medium20White,
        headlineMedium:AppStyles.medium24White,
      bodyMedium: AppStyles.medium24Black,
    ));
}