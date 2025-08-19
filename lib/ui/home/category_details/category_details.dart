import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/ui/home/category_details/Source/source_tab_widget.dart';
import 'package:news_app/ui/home/category_details/sources_view_model.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  Category category;
   CategoryDetails({super.key, required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  SourcesViewModel viewModel=SourcesViewModel();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
       child: Consumer<SourcesViewModel>(
         builder: (context, viewModel, child) {
           if(viewModel.errorMessage!=null){
             return Center(
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text(viewModel.errorMessage!,
                             style: Theme.of(context).textTheme.labelMedium,),
                             SizedBox(height: 8,),
                             ElevatedButton(
                                 onPressed: () {
                                   viewModel.getSources(widget.category.id);

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
           else if(viewModel.sourcesList==null){
             return Center(
                         child: CircularProgressIndicator(
                           color: AppColors.greyColor,
                         ),
                       );
           }else{
            return SourceTabWidget(sourcesList: viewModel.sourcesList!);
           }

       },)
      // FutureBuilder<SourceResponse?>(
      //     future: ApiManager.getSources(widget.category.id),
      //     builder: (context, snapshot) {
      //       if (snapshot.connectionState == ConnectionState.waiting) {
      //         return Center(
      //           child: CircularProgressIndicator(
      //             color: AppColors.greyColor,
      //           ),
      //         );
      //       }
      //       else if (snapshot.hasError) {
      //         return Center(
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Text(AppLocalizations.of(context)!.something_went_wrong,
      //               style: Theme.of(context).textTheme.labelMedium,),
      //               SizedBox(height: 8,),
      //               ElevatedButton(
      //                   onPressed: () {
      //                     ApiManager.getSources(widget.category.id);
      //                     setState(() {
      //
      //                     });
      //                   },
      //                   style: ElevatedButton.styleFrom(
      //       backgroundColor: AppColors.greyColor,
      //       shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(10)
      //       )
      //       ),
      //                   child: Text(AppLocalizations.of(context)!.try_again,
      //                     style: Theme.of(context).textTheme.labelMedium,))
      //             ],
      //           ),
      //         );
      //       }
      //       if(snapshot.data?.status !='ok'){
      //         Center(
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Text(snapshot.data!.message!,
      //                 style: Theme.of(context).textTheme.labelMedium,),
      //               SizedBox(height: 8,),
      //               ElevatedButton(
      //                   onPressed: () {
      //                     ApiManager.getSources(widget.category.id);
      //                     setState(() {
      //
      //                     });
      //                   },
      //                   style: ElevatedButton.styleFrom(
      //                     backgroundColor: AppColors.greyColor,
      //                     shape: RoundedRectangleBorder(
      //                       borderRadius: BorderRadius.circular(10)
      //                     )
      //                   ),
      //                   child: Text(AppLocalizations.of(context)!.try_again,
      //                     style: Theme.of(context).textTheme.labelMedium,))
      //             ],
      //           ),
      //         );
      //       }
      //       var sourcesList=snapshot.data?.sources ?? [];
      //       return SourceTabWidget(sourcesList: sourcesList);
      //
      //     },
      // ),
    );
  }
}
