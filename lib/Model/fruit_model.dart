
class FruitModel {
  final String name;
  final String price;
  final String image;
  bool isFavorite;

  FruitModel({
    required this.name,
    required this.price,
    required this.image,
    this.isFavorite = false,
  });



}
