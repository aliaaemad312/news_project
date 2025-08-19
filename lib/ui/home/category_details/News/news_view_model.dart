import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/model/NewsResponse.dart';

class NewsViewModel extends ChangeNotifier{


  List<News>?newsList;
  String?errorMessage;
  
  void getNewsBySourceId(String sourceId, String language,int page,int pageSize)async{
    newsList=null;
    errorMessage=null;
    notifyListeners();
   try{
     var response= await ApiManager.getNewsBySourceId(sourceId, language, page, pageSize);
     if(response?.status=='error'){
       errorMessage=response!.message!;
     }else{
       newsList=response!.articles!;
     }
   }catch(e){
     errorMessage=e.toString();

   }
   notifyListeners();
  }
}