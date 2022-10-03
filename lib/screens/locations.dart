import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testrick/screens/datails/locations_datails.dart';
import 'package:testrick/widgets/location_fetch.dart';


class LocationsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  final  fetchlocations = Provider.of<LocationFetch>(context);
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
      title: Text(fetchlocations.isLoading? 'Cargando...' : 'Rick Y Morty Localizaciones') ,
      centerTitle: true,
   ),
   body: Column(
      children: [
        fetchlocations.isLoading? Center(
          child: CircularProgressIndicator(
            color: Color.fromARGB(255, 7, 234, 18), ///TU CAMBIAS
           ),
        ) : Expanded(
          
          child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 20, right: 18),
            
            physics: BouncingScrollPhysics(),
            itemCount: fetchlocations.locationlist.length,
            itemBuilder: (
              (context, index) { final locationslists = fetchlocations.locationlist[index];
                return GestureDetector(
                  onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) =>LocationsDatailsScreen(locationsModel: locationslists,) , ///SE LE CAMBIA ESYO
                      )
                     );
                    },
                  child: Card(
                    elevation: 0,
                    child: Padding(padding: EdgeInsets.all(10),
                    child: Row(children: [
                      Flexible(
                        child: Hero(
                          
                          tag: locationslists.name, ///SE CAMBIO
                           child: ClipRRect(
                            borderRadius:BorderRadius.circular(10) , ///LINEA DE ABAJO SE CAMBIO
                            child: CachedNetworkImage(imageUrl: 'https://www.heraldonews.com/wp-content/uploads/2022/09/BG3APAIYXZBSZPNBSYBPHVQBUA-6-1170x688.jpg', height: 80,
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
                           locationslists.name, ///se cambio NOMBRE
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight:  FontWeight.w800
                            ),
                          ),
                          SizedBox(height: 8,),
                          Text(locationslists.dimension.toString() ,  ///SE CAMBIO
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