import 'package:ecomeerce_ui/Model/Category_class.dart';
import 'package:ecomeerce_ui/Model/fruit_model.dart';

final List<FruitModel> fruits = [
  FruitModel(
    name: "Honey Lime Combo",
    price: "₦ 2,000",
    image: "assets/images/Honey_lime.png",
    CategoryId: 2,
    id: 1,
    isRecomended: true,
  ),
  FruitModel(
    id: 2,
    CategoryId: 2,
    name: "Berry Mango Combo",
    price: "₦ 8,000",
    image: "assets/images/Glowing-Berry-Fruit-Salad.png",
    isRecomended: true,
  ),
  FruitModel(
    id: 3,
    CategoryId: 1,
    name: "Quinoa fruit salad",
    price: "₦ 10,000",
    image: "assets/images/Quinoa_fruit_salad.png",
    isRecomended: false,
  ),
  FruitModel(
    id: 4,
    CategoryId: 1,
    name: "Tropical Fruit Salad",
    price: "₦ 10,000",
    image: "assets/images/Tropical_fruit_salad.png",
    isRecomended: false,
  ),
  FruitModel(
    id: 5,
    CategoryId: 1,
    name: "Berry Mango Combo",
    price: "₦ 8,000",
    image: "assets/images/Glowing-Berry-Fruit-Salad.png",
    isRecomended: false,
  ),
  FruitModel(
    id: 6,
    CategoryId: 1,
    name: " Kiwiberry fruit salad",
    price: "₦ 10,000",
    image: "assets/images/Berry_KiwiBerry_Fruit_salad.png",
    isRecomended: false,
  ),
  FruitModel(
    id: 7,
    CategoryId: 3,
    name: "Honey Lime Combo",
    price: "₦ 8,000",
    image: "assets/images/Honey_lime.png",
    isRecomended: false,
  ),
  FruitModel(
    id: 8,
    CategoryId: 4,
    name: "Mix  Combo",
    price: "₦ 12,000",
    image: "assets/images/Mix.png",
    isRecomended: false,
  ),
];

final List<Category> category = [
  Category(id: 01, name: "Hottest"),
  Category(id: 02, name: "Popular"),
  Category(id: 03, name: "New Combo"),
  Category(id: 04, name: "Top"),
];

List<FruitModel> getRecomended(){
  return fruits.where((f) => f.isRecomended).toList();
}

List<FruitModel> getCategoryId( int Category){
 return fruits.where((f) => f.CategoryId == Category).toList();
}
