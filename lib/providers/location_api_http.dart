import 'package:dio/dio.dart';
import 'package:testrick/models_simple/locationsricksimplelist.dart';
import 'package:testrick/providers/url_constants.dart';

class Location_api_http {
  static var dio = Dio ();

  static Future<List<Result>> apli_http_locations () async {
    var response = await dio.get(baseUrlloc);

     if (response.statusCode == 200) {
      LocationsRickSimpleList locationsRickSimpleList = LocationsRickSimpleList.fromMap(response.data);
      return locationsRickSimpleList.results;
  } else {
                throw Exception('Fallo en la carga de informacion  revise el codigo  🤦‍♂️');

    }
  }
}