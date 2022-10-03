import 'package:flutter/material.dart';
import 'package:testrick/screens/characters.dart';
import 'package:testrick/screens/datails/character_datails.dart';
import 'package:provider/provider.dart';
import 'package:testrick/widgets/character_fetch.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final  fetchcharacter = Provider.of<Apli_Characters>(context);
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[Colors.green, Colors.yellow]
                )
            ),
        ),
      elevation: 0,
      title: Text(fetchcharacter.isLoading? 'Cargando...' : 'Rick Y Morty App') ,
      centerTitle: true,
   ),
    body: Column(
      children: [
        fetchcharacter.isLoading? Center(
          child: CircularProgressIndicator(
            color: Color.fromARGB(255, 7, 234, 18), ///TU CAMBIAS
           ),
        ) : Expanded(
          
          child: ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: fetchcharacter.resultlist.length,
            itemBuilder: (
              (context, index) { final characterslists = fetchcharacter.resultlist[index];
                return GestureDetector(
                  onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) =>CharacterDatailsScreen(datailsModel:characterslists) , ///SE LE CAMBIA ESYO
                      )
                     );
                    },
                  child: Card(
                    
                    elevation: 0,
                    child: Padding(padding: EdgeInsets.all(10),
                    child: Row(children: [
                      Flexible(
                        child: Hero(
                          tag: characterslists.name, ///SE CAMBIO
                           child: ClipRRect(
                            borderRadius:BorderRadius.circular(10) , ///LINEA DE ABAJO SE CAMBIO
                            child: CachedNetworkImage(imageUrl: characterslists.image, height: 120,
                            placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(color: Color.fromARGB(255, 63, 225, 22) ),
                            ),
                            errorWidget: (context, url, error) =>  Icon(Icons.error),
                          ),
                          )
                        ),
                      ),
                    
                      SizedBox(width: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                           characterslists.name, ///se cambio NOMBRE
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight:  FontWeight.w800
                            ),
                          ),
                          SizedBox(height: 8,),
                          Text(characterslists.status.toString() ,  ///SE CAMBIO
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.redAccent,
                          ),
                          maxLines: 2,
                          )
                        ],
                      )
                    ],
                    ),
                  ),
                  ),
                  );  
                }
              )
            )
          )
      ],
     ),
    );
  }
}