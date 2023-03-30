import 'package:flutter/material.dart';
import 'package:resto/recette.dart';
// import 'package:transparent_image/transparent_image.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import 'RecetteScreen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,//Pour masquer le debug qui s'affiche au niveau du device
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RecetteScreen(
         Recette(
          'Pizza Facile',
          'Par Abdoulaye Camara',
          'https://assets.afcdn.com/recipe/20160519/15342_w600.jpg',
          "Faire cuire une poete les lardons et les champignons. \n Dans un bol, verser la boite de concentre de tomate, y ajouter un demi verre d'eau, ensuite mettre un carre de sucre (pour enlever l'acidite de la tomate) une pincee de sel de poivre, et une pincee d'herbe de Provence.",
          false,
          44
        ),
      ),
    );
  }
}


