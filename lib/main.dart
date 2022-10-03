import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:testrick/screens/menu.dart';
import 'package:testrick/widgets/wigets.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) =>Apli_Characters ()), ///Este dato viene de la carpeta fetch
        ChangeNotifierProvider(create: (_) =>EpisodeFetch ()), ///Este dato viene de la carpeta fetch
        ChangeNotifierProvider(create: (_) =>LocationFetch ()), ///Este dato viene de la carpeta fetch

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rick y Morty',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BottomNavBar(),
      ),
    );
  }
}