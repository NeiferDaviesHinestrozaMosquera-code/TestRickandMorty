import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:testrick/models_simple/ricksimplelist.dart';


class CharacterDatailsScreen extends StatelessWidget {

  CharacterDatailsScreen({Key? key, required this.datailsModel}) : super(key: key);
  late Result datailsModel;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 52, 238, 10),
      elevation: 0,
      title: Text(datailsModel.name) ,
      centerTitle: true,
        ),
        body:SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
                 Hero(
                        tag: datailsModel.name,
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
                              child: CachedNetworkImage(imageUrl: datailsModel.image, height: 250,
                              placeholder: (context, url) => Center(
                                child: CircularProgressIndicator(color: Color(0xff2c3e50) ),
                              ),
                              errorWidget: (context, url, error) =>  Icon(Icons.error),
                      ),
                    ),
                  ),
                )
              ),

                SizedBox(
                height: 20,
              ),
              Text(datailsModel.id.toString(),
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
                fontWeight: FontWeight.bold
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Text(datailsModel.name,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
                fontWeight: FontWeight.bold
                ),
              ),

              SizedBox(height: 18,),
              Text (datailsModel.status,
             style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.bold)
              ),

               SizedBox(height: 9,),
              Text (datailsModel.species.toString(),
             style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                )
              ),

              SizedBox(height: 9,),
              Text (datailsModel.gender.toString(),
             style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                )
              ),

              SizedBox(height: 9,),
              Text (datailsModel.created.toString(),
             style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                )
              ),

              SizedBox(height: 9,),
              Text (datailsModel.origin.toString(),
             style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                )
              ),

              SizedBox(height: 9,),
              Text (datailsModel.url.toString(),
             style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                )
              ),
            ],
          ),
        ) ,
     );
  }
}