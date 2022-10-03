import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testrick/widgets/character_fetch.dart';


class ImagesScreen extends StatelessWidget {

   @override
  Widget build(BuildContext context) {
  final  fetch = Provider.of<Apli_Characters>(context);
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
      title: Text(fetch.isLoading? 'Cargando...' : 'Rick Y Morty Imagenes') ,
      centerTitle: true,
   ),
   body: Center(
    child:Text('Hpa')
     )
   );
  }
}