import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/utils/app_colors.dart';

class AppStyles{
  static TextStyle bold24Black=GoogleFonts.inter(
    color: AppColors.blackColor,
    fontSize: 24,
    fontWeight: FontWeight.bold
  );
  static TextStyle bold16Black=GoogleFonts.inter(
      color: AppColors.blackColor,
      fontSize: 16,
      fontWeight: FontWeight.bold
  );
  static TextStyle bold16White=GoogleFonts.inter(
      color: AppColors.whiteColor,
      fontSize: 16,
      fontWeight: FontWeight.bold
  );
  static TextStyle bold20White=GoogleFonts.inter(
      color: AppColors.whiteColor,
      fontSize: 16,
      fontWeight: FontWeight.bold
  );
  static TextStyle medium16Black = GoogleFonts.inter(
    color: AppColors.blackColor,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static TextStyle medium12Grey = GoogleFonts.inter(
    color: AppColors.greyColor,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  static TextStyle medium20Black = GoogleFonts.inter(
    color: AppColors.blackColor,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
  static TextStyle medium20White = GoogleFonts.inter(
    color: AppColors.whiteColor,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
  static TextStyle medium24Black = GoogleFonts.inter(
    color: AppColors.blackColor,
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );
  static TextStyle medium24White = GoogleFonts.inter(
    color: AppColors.whiteColor,
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );
  static TextStyle medium14Black = GoogleFonts.inter(
    color: AppColors.blackColor,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static TextStyle medium14White = GoogleFonts.inter(
    color: AppColors.whiteColor,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

}