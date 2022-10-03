import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:testrick/models_simple/episodericksimplelist.dart';



class EpisodesDatailsScreen extends StatelessWidget {

  EpisodesDatailsScreen({Key? key, required this.episodesModel}) : super(key: key);
  late Result episodesModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 52, 238, 10),
      elevation: 0,
      title: Text(episodesModel.name) ,
      centerTitle: true,
        ),
        body:SingleChildScrollView(
          
          child: SizedBox(
            height: 300,
            child: Column(
              children: [
                SizedBox(height: 20,),
                   Flexible(
                    fit: FlexFit.tight,
                     child: Hero(
                            tag: episodesModel.id,
                             child: Center(
                               child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius:  BorderRadius.circular(10),
                                  boxShadow: [BoxShadow(color:Color(0xff2c3e50).withOpacity(0.2),
                                  blurRadius: 10,
                                  spreadRadius: 5,
                                  )
                                  ]),
                                child: ClipRRect(
                                  borderRadius:BorderRadius.circular(10) ,
                                child: CachedNetworkImage(imageUrl: 'https://i.pinimg.com/originals/5d/07/43/5d074382ca18c4cf06e7fd9c4656ea7b.png', height: 120,
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
                Text(episodesModel.name,
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
                Text(episodesModel.airDate.toString(),
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                  ),
                ),

                  SizedBox(
                  height: 20,
                ),
                Text(episodesModel.episode.toString(),
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                  ),
                ),

                //   SizedBox(
                //   height: 20,
                // ),
                // Text(episodesModel.characters.toString(),
                // style: TextStyle(
                //   color: Colors.black54,
                //   fontSize: 20,
                //   fontWeight: FontWeight.bold
                //   ),
                // ),

                  SizedBox(
                  height: 20,
                ),
                Text(episodesModel.url.toString(),
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                  ),
                ),

                  SizedBox(
                  height: 20,
                ),
                Text(episodesModel.created.toString(),
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                  ),
                ),

              ],
            ),
          ),
        ) ,
     );
  }
}