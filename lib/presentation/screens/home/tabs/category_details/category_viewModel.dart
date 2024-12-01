import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/model/sources_response/source.dart';
import 'package:news_app/data/model/sources_response/sources_response.dart';

class CategoryViewModel extends ChangeNotifier{
  List<Source>? sources;
  String? errorMessage;
  bool isLoading=false;


  void getSourcesByCategoryId(String categoryId)async{
   try{
     isLoading=true;
     notifyListeners();
     SourcesResponse response =await ApiManager.getSources(categoryId);
     isLoading=false;
     if(response.status=='ok'){
       sources=response.sources;
     }else{
       errorMessage=response.message;
     }
   }catch(error){
     isLoading=false;
     errorMessage=error.toString();
   }
   notifyListeners();
  }
}