import 'dart:ffi';

class Recette {
  String titre;
  String auteur;
  String imageUrl;
  String description;
  bool isFavorited;
  int favoriteCount;

  Recette(
      this.titre,
      this.auteur,
      this.imageUrl,
      this.description,
      this.isFavorited,
      this.favoriteCount
      );
}