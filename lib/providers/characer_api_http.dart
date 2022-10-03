
import 'package:dio/dio.dart';
import 'package:testrick/models_simple/ricksimplelist.dart';
import 'package:testrick/providers/url_constants.dart';



class Api_Http {
  static var dio = Dio();

  static Future <List<Result>> apli_http_characters () async {
    var response = await dio.get(baseUrl);

     if (response.statusCode == 200) {

    
      RickSimpleList rickSimpleList = RickSimpleList.fromMap(response.data);  ///SE REALIZO CAMBIO
      return rickSimpleList.results; ///SE REALIZO CAMBIO


    } else {
      throw Exception('Fallo en la carga de informacion  revise el codigo  🤦‍♂️');
    } 

  }

  static Future<Info> apli_http_episodes() async {
    var response = await dio.get(baseUrl);

    if(response.statusCode == 200) {
      RickSimpleList rickSimpleList = RickSimpleList.fromMap(response.data);  ///SE REALIZO CAMBIO
      return rickSimpleList.info;
      
    } else {
            throw Exception('Fallo en la carga de informacion  revise el codigo  🤦‍♂️');

    }
  }

}