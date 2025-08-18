import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/providers/app_theme_provider.dart';
import 'package:news_app/ui/home/category_fragment/widget/category_item.dart';
import 'package:provider/provider.dart';

typedef OnCategoryItemClick=void Function(Category);
class CategoryFragment extends StatelessWidget {
  List<Category>categoriesList=[];
  OnCategoryItemClick onCategoryItemClick;
   CategoryFragment({super.key, required this.onCategoryItemClick});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    var themeProvider=Provider.of<AppThemeProvider>(context);
    categoriesList=Category.getCategoriseList(context, themeProvider.isDarkMode());
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: width*0.04,
      vertical: height*0.02),
      child: Column(
        children: [
          Text('${AppLocalizations.of(context)!.good_morning}\n${AppLocalizations.of(context)!.here_is_some_news_for_you}',
          style: Theme.of(context).textTheme.headlineMedium,),
          SizedBox(height: height*0.01,),
          Expanded(
            child: ListView.separated(itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  onCategoryItemClick(categoriesList[index]);

                },
                  child: CategoryItem(category: categoriesList[index],index: index,));
            },
                separatorBuilder: (context, index) => SizedBox(height: height*0.01,),
                itemCount: categoriesList.length),
          )

        ],
      ),
    );
  }
}
