
class FruitModel {
  final int id;
  final String name;
  final String price;
  final String image;
  final int CategoryId;
  bool isRecomended;
  bool isFavorite;


  FruitModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.CategoryId,
    this.isRecomended =false,
    this.isFavorite = false,
  });



}

