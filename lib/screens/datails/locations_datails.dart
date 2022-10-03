import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:testrick/models_simple/locationsricksimplelist.dart';


class LocationsDatailsScreen extends StatelessWidget {

 LocationsDatailsScreen({Key? key, required this.locationsModel}) : super(key: key);
  late Result locationsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 52, 238, 10),
      elevation: 0,
      title: Text(locationsModel.name) ,
      centerTitle: true,
        ),
        body:SafeArea(
          
          child: Container(
            height: MediaQuery.of(context).size.height * 0.30,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: SizedBox(
                height: 300,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      Expanded(child: SizedBox(height: 20,)),
                         Flexible(
                           child: Hero(
                                  tag: locationsModel.id,
                                   child: Center(
                                     child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:  BorderRadius.circular(10),
                                        boxShadow: [BoxShadow(color:Color(0xff2c3e50).withOpacity(0.2),
                                        blurRadius: 10,
                                        spreadRadius: 5,
                                        )
                                        ]),
                                      child: ClipRRect(
                                        borderRadius:BorderRadius.circular(10) ,
                                        child: CachedNetworkImage(imageUrl: 'https://www.heraldonews.com/wp-content/uploads/2022/09/BG3APAIYXZBSZPNBSYBPHVQBUA-6-1170x688.jpg', height: 70,
                                        placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator(color: Color(0xff2c3e50) ),
                                        ),
                                        errorWidget: (context, url, error) =>  Icon(Icons.error),
                                ),
                              ),
                            ),
                                         )
                                       ),
                         ),
                        
                      SizedBox(
                        height: 20,
                      ),
                      Text(locationsModel.name,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                        ),
                      ),
                        
                        SizedBox(
                        height: 20,
                      ),
                      Text(locationsModel.type.toString(),
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                        ),
                      ),
                        
                        SizedBox(
                        height: 20,
                      ),
                      Text(locationsModel.dimension.toString(),
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                        ),
                      ),
                        
                       SizedBox(
                        height: 20,
                      ),
                      Text(locationsModel.residents.toString(),
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                        ),
                      ),
                        
                        SizedBox(
                        height: 20,
                      ),
                      Text(locationsModel.url.toString(),
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                        ),
                      ),
                        
                        SizedBox(
                        height: 20,
                      ),
                      Text(locationsModel.created.toString(),
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                        ),
                      ),
                        
                    ],
                  ),
                ),
              ),
            ),
          ),
        ) ,
     );
  }
}