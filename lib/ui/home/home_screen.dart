import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/providers/app_language_provider.dart';
import 'package:news_app/providers/app_theme_provider.dart';
import 'package:news_app/ui/home/category_details/category_details.dart';
import 'package:news_app/ui/home/category_fragment/category_fragment.dart';
import 'package:news_app/ui/home/drawer/home_drawer.dart';
import 'package:news_app/utils/app_assets.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_routes.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:news_app/utils/app_theme.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    var themeProvider=Provider.of<AppThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedCategory==null?
            AppLocalizations.of(context)!.home:selectedCategory!.title,
        style: Theme.of(context).textTheme.headlineLarge),
        actions: [
          InkWell(
            onTap: (){
              Navigator.of(context).pushNamed(AppRoutes.searchNewsRouteName);

            },
              child:themeProvider.isDarkMode()? Image.asset(AppAssets.searchIconDark):
              Image.asset(AppAssets.searchIconLight)),
          SizedBox(width: 16,)
        ],
      ),
      drawer: HomeDrawer(onDrawerItemClick: onDrawerItemClick,),
      body:  selectedCategory==null?
      CategoryFragment(onCategoryItemClick: onCategoryItemClick,):
      CategoryDetails(category: selectedCategory!,),

    );
  }
  Category? selectedCategory;
  void onCategoryItemClick(Category newSelectedCategory){
    selectedCategory=newSelectedCategory;
    setState(() {

    });

  }

  void onDrawerItemClick(){
    selectedCategory=null;
    Navigator.pop(context);
    setState(() {

    });

  }
}


//c380ceb571f3439babd1d913340a8f81