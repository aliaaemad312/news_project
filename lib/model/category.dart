import 'package:flutter/cupertino.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/utils/app_assets.dart';

class Category{
  String id;
  String title;
  String image;

  Category({required this.id, required this.title, required this.image});

  static List<Category> getCategoriseList(BuildContext context,bool isDark){
    return [
      Category(id: 'general',
          title:AppLocalizations.of(context)!.general,
          image: isDark?AppAssets.generalDarkImage:AppAssets.generalLightImage),
      Category(id: 'business',
          title:AppLocalizations.of(context)!.business,
          image: isDark?AppAssets.businessDarkImage:AppAssets.businessLightImage),
      Category(id: 'sports',
          title:AppLocalizations.of(context)!.sports,
          image: isDark?AppAssets.sportsDarkImage:AppAssets.sportsLightImage),
      Category(id: 'technology',
          title:AppLocalizations.of(context)!.technology,
          image: isDark?AppAssets.technologyDarkImage:AppAssets.technologyLightImage),
      Category(id: 'entertainment',
          title:AppLocalizations.of(context)!.entertainment,
          image: isDark?AppAssets.entertainmentDarkImage:AppAssets.entertainmentLightImage),
      Category(id: 'health',
          title:AppLocalizations.of(context)!.health,
          image: isDark?AppAssets.healthDarkImage:AppAssets.healthLightImage),
      Category(id: 'science',
          title:AppLocalizations.of(context)!.science,
          image: isDark?AppAssets.scienceDarkImage:AppAssets.scienceLightImage)
    ];
  }
}