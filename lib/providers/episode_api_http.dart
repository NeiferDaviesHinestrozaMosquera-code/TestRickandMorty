
import 'package:dio/dio.dart';
import 'package:testrick/models_simple/episodericksimplelist.dart';
import 'package:testrick/providers/url_constants.dart';

class Episode_api_http {
  static var dio = Dio();

  static Future<List<Result>> apli_http_episodes () async {
    var response = await dio.get(baseUrlepi);

    if (response.statusCode == 200) {

     EpisodesRickSimpleList episodesRickSimpleList = EpisodesRickSimpleList.fromMap(response.data);
      return episodesRickSimpleList.results;
  
      
    }else {
            throw Exception('Fallo en la carga de informacion  revise el codigo  🤦‍♂️');

    }
  }
}