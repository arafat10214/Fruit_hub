import 'package:ecomeerce_ui/Model/fruit_model.dart';
import 'package:flutter/material.dart';


class FavoriteProvider with ChangeNotifier {
  final List<FruitModel> _favorites = [];

  List<FruitModel> get favorites => _favorites;

  void toggleFavorite(FruitModel fruit) {
    fruit.isFavorite = !fruit.isFavorite;
    if (fruit.isFavorite) {
      _favorites.add(fruit);
    } else {
      _favorites.removeWhere((item) => item.name == fruit.name);
    }
    notifyListeners();
  }
}
