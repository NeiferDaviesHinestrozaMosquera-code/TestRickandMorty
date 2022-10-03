import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:testrick/screens/datails/episodes_datails.dart';
import 'package:testrick/widgets/character_fetch.dart';
import 'package:testrick/widgets/episode_fetch.dart';


class EpisodesScreen extends StatelessWidget {
  //const EpisodesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final  fetchepisodes = Provider.of<EpisodeFetch>(context);
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
      title: Text(fetchepisodes.isLoading? 'Cargando...' : 'Rick Y Morty Episodios') ,
      centerTitle: true,
   ),
    body: Column(
      children: [
        fetchepisodes.isLoading? Center(
          child: CircularProgressIndicator(
            color: Color.fromARGB(255, 7, 234, 18), ///TU CAMBIAS
           ),
        ) : Expanded(
          
          child: ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: fetchepisodes.episodeList.length,
            itemBuilder: (
              (context, index) { final episodeslists = fetchepisodes.episodeList[index];
                return GestureDetector(
                  onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) =>EpisodesDatailsScreen(episodesModel: episodeslists),
                    /// Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(characterModel: character,),
                      )
                     );
                    },
                  child: SafeArea(
                    child: Card(
                      elevation: 0,
                      child: Padding(padding: EdgeInsets.all(10),
                      child: Row(children: [
                        Flexible(
                          child: Hero(
                            
                            tag: episodeslists.name, ///SE CAMBIO
                             child: ClipRRect(
                              borderRadius:BorderRadius.circular(10) , ///LINEA DE ABAJO SE CAMBIO
                              child: CachedNetworkImage(imageUrl: 'https://i.pinimg.com/originals/5d/07/43/5d074382ca18c4cf06e7fd9c4656ea7b.png', height: 120,
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
                             episodeslists.name, ///se cambio NOMBRE
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight:  FontWeight.w800
                              ),
                            ),
                  
                            SizedBox(height: 8,),
                            Text(episodeslists.episode.toString() ,  ///SE CAMBIO
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.redAccent,
                            ),
                            maxLines: 2,
                            ),
                  
                          ],
                        )
                      ],
                      ),
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