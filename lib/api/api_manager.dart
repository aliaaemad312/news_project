import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/api/end_points.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';
//https://newsapi.org/v2/everything?q=bitcoin&apiKey=c380ceb571f3439babd1d913340a8f81
class ApiManager{
  static Future<SourceResponse?> getSources(String categoryId)async{
    Uri url= Uri.https(ApiConstants.baseUrl,EndPoints.sourceApi,{
      'apiKey': ApiConstants.apiKey,
      'category': categoryId

    });
   try{
     var response= await http.get(url);
     var responseBody=response.body;
     var json=jsonDecode(responseBody);
     //SourceResponse.fromJson(jsonDecode(response.body));
     return SourceResponse.fromJson(json);
   }catch(e){
     throw e;
   }


  }

  static Future<NewsResponse?> getNewsBySourceId(String sourceId,String language,int page,int pageSize)async{
    Uri url=Uri.https(ApiConstants.baseUrl,EndPoints.newsApi,{
      'apiKey':ApiConstants.apiKey,
      'sources':sourceId,
      'language':language,
      'page': page.toString(),
      'pageSize': pageSize.toString()

    });
    try{
      var response=await http.get(url);
      var responseBody=response.body ;
      var json=jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    }catch(e){
      throw e;
    }

  }

  static Future<NewsResponse?> searchNews(String query)async{
    Uri url=Uri.https(ApiConstants.baseUrl,EndPoints.newsApi,{
      'apiKey':ApiConstants.apiKey,
      'q':query,

    });
    try{
      var response=await http.get(url);
      var responseBody=response.body ;
      var json=jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    }catch(e){
      throw e;
    }

  }




}