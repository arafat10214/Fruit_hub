import 'package:ecomeerce_ui/Model/fruit_model.dart';
import 'package:ecomeerce_ui/Provider/favourite_provider.dart';
import 'package:ecomeerce_ui/fruit_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AddToBasket extends StatefulWidget {
  final String name;
  final String price;
  final String image;

  const AddToBasket({
    super.key,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  State<AddToBasket> createState() => _AddToBasketState();
}

class _AddToBasketState extends State<AddToBasket> {
  List<Map<String, dynamic>> basketItems = [];
  int quantity = 1;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<FavoriteProvider>(context);
    int basePrice = int.tryParse(widget.price) ?? 0;
    int totalPrice = basePrice * quantity;

    final RecomendedProducts = getRecomended();

    // Null-safe favorite check
    final fruitInFav = RecomendedProducts.firstWhere(
      (f) => f.name == widget.name,
      orElse: () => FruitModel(
        name: widget.name,
        price: widget.price,
        image: widget.image,
        isFavorite: false, 
        id: 1, CategoryId: 1,
      ),
    );
    isFavorite = fruitInFav.isFavorite;

    return Scaffold(
      backgroundColor: const Color(0xFFFFA54B),
      body: Column(
        children: [
          // Top Orange Section
          Container(
            color: const Color(0xFFFF8C33),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                // Back Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 32,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_back_ios_new, size: 18, color: Colors.black),
                          SizedBox(width: 4),
                          Text(
                            "Go back",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Product Image
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      widget.image,
                      height: 176,
                      width: 176,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
          // Bottom White Section
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Brandon Grotesque",
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Quantity + Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          _buildQtyButton(Icons.remove, () {
                            if (quantity > 1) setState(() => quantity--);
                          }),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              "$quantity",
                              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ),
                          _buildQtyButton(Icons.add, () {
                            setState(() => quantity++);
                          }),
                        ],
                      ),
                      Text(
                        "₦ $totalPrice",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Brandon Grotesque",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 64),
                  const Text(
                    "One Pack Contains:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Brandon Grotesque",
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Red Quinoa, Lime, Honey, Blueberries, Strawberries, Mango, Fresh mint.",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Brandon Grotesque",
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 44),
                  const Text(
                    "If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you.",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Brandon Grotesque",
                      height: 1.5,
                    ),
                  ),
                  const Spacer(),
                  // Favorite + Add to Basket
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                          favProvider.toggleFavorite(fruitInFav);
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.orange.shade50,
                            shape: BoxShape.circle,
                            border: Border.all(color: const Color(0xFFFF8C33), width: 0),
                          ),
                          child: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_outline,
                            color: const Color(0xffFFA451),
                            size: 24,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 220,
                        height: 56,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFA54B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            final item = {
                              'name': widget.name,
                              'price': widget.price,
                              'image': widget.image,
                              'quantity': quantity,
                            };
                            final existingIndex = basketItems.indexWhere(
                                (element) => element['name'] == widget.name);
                            if (existingIndex != -1) {
                              basketItems[existingIndex]['quantity'] += quantity;
                            } else {
                              basketItems.add(item);
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Added to basket!"),
                                duration: Duration(seconds: 1),
                                backgroundColor: Color(0xFFFFA54B),
                              ),
                            );
                          },
                          child: const Text(
                            "Add to basket",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Brandon Grotesque",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQtyButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 28,
        width: 28,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black54, width: 1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 16, color: Colors.black),
      ),
    );
  }
}
