import 'package:testrick/providers/episode_api_http.dart';
import 'package:flutter/material.dart';
import 'package:testrick/models_simple/episodericksimplelist.dart';
import 'package:flutter/cupertino.dart';



class EpisodeFetch extends ChangeNotifier {
    bool isLoading = false;
    List<Result> episodeList = [];

    EpisodeFetch(){
      http_episode();
    }

    Future <void> http_episode() async {

      isLoading = true;
      notifyListeners();

      episodeList = await Episode_api_http.apli_http_episodes();
      
      
      isLoading = false;
      notifyListeners();
    }

}