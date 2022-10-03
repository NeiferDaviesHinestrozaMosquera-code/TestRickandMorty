import 'package:flutter/material.dart';

import 'package:testrick/models_simple/ricksimplelist.dart';

import 'package:testrick/providers/characer_api_http.dart';



class Apli_Characters extends ChangeNotifier {
  bool isLoading = false;
  List<Result> resultlist = [];

   Apli_Characters(){
    http_characters();
    }

   Future <void> http_characters () async {
    isLoading = true;
    notifyListeners();

    resultlist = await Api_Http.apli_http_characters(); ///SE REALIZO CAMBIO
    isLoading = false;
    notifyListeners();
  }

}

class Episode_Apli extends ChangeNotifier {

  bool isLoading = false;

   List<Info> episodelist = <Info> [];
    Episode_Apli(){
    http_episodes();
    }

   Future <void> http_episodes () async {
    isLoading = true;
    notifyListeners();

   episodelist = (await Api_Http.apli_http_episodes()) as List<Info>; ///SE REALIZO CAMBIO
    isLoading = false;
    notifyListeners();
   }
}

