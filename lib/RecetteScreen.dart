// ignore: file_names
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:resto/favoriteChangeNotifier.dart';
import 'package:resto/favoriteWidget.dart';
import 'package:resto/recette.dart';
import 'package:provider/provider.dart';
class RecetteScreen extends StatelessWidget {
  final Recette recette;
  RecetteScreen( @required this.recette, {super.key});

  @override
  Widget build(BuildContext context) {
    Widget titleSection =  Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child:Text(recette.titre,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
                ),
                Text(recette.auteur,
                  style: TextStyle(
                      color: Colors.grey[500]
                  ),),
              ],
            ),
          ),
          FavoriteIconWidget(),
          FavoriteTextWidget(),
        ],
      ),
    );
    Widget buttonSection = Container(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(Colors.blue, Icons.comment, "Commenter"),
          _buildButtonColumn(Colors.blue, Icons.share, "Partager")
        ],
      ),
    );
    Widget desccriptionSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        recette.description,
        softWrap: true,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );

    return ChangeNotifierProvider(
      create: (context) => FavoriteChangeNotifier(recette.isFavorited, recette.favoriteCount),
      child: Scaffold(
          appBar: AppBar(
            title: Text("Mes recettes"),
          ),
          body: ListView(children: [
            CachedNetworkImage(
              imageUrl: recette.imageUrl,
              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            desccriptionSection
          ],
          )
      ),
    );
  }
  Column _buildButtonColumn(Color color, IconData icon, String label){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 8),
          child: Icon(icon, color: color,),
        ),
        Text(label,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: color
          ),)
      ],
    );
  }


}

