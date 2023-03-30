import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resto/favoriteChangeNotifier.dart';

class FavoriteIconWidget extends StatefulWidget{
  _FavoriteIconWidgetState createState() => _FavoriteIconWidgetState();

}

class _FavoriteIconWidgetState extends State<FavoriteIconWidget>{
  @override
   bool _isFavorite = true;
    _toggleFavorite (FavoriteChangeNotifier _notifier){
    setState(() {
      if(_isFavorite){
        _isFavorite = false;
      }else{
        _isFavorite = true;
      }
      _notifier.isFavorited = _isFavorite;
    });
  }
  @override
  Widget build(BuildContext context) {
    FavoriteChangeNotifier _notifier = Provider.of<FavoriteChangeNotifier>(context);
    _isFavorite = _notifier.isFavorited;
    return Row(
      children: [
        IconButton(
            onPressed: _toggleFavorite(_notifier),
            icon: Icon( _isFavorite ? Icons.favorite:Icons.favorite_border, color: Colors.red)
        ),
      ],
    );
  }
}

class FavoriteTextWidget extends StatefulWidget{
  _FavoriteTextWidgetState createState() => _FavoriteTextWidgetState();
}

class _FavoriteTextWidgetState extends State<FavoriteTextWidget>{

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteChangeNotifier>(
        builder:(context, notifier, _) => Text(notifier.favoriteCount.toString()),
    );
  }
}