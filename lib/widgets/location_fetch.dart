
import 'package:flutter/cupertino.dart';
import 'package:testrick/models_simple/locationsricksimplelist.dart';
import 'package:testrick/providers/location_api_http.dart';

class LocationFetch extends ChangeNotifier {
  bool isLoading = false;
  List<Result> locationlist = [];

  LocationFetch(){
    http_locations();
  }

  Future <void> http_locations() async{
    isLoading = true;
    notifyListeners();

    locationlist = await Location_api_http.apli_http_locations();
    isLoading = false;
    notifyListeners();
  }
}