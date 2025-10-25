import 'package:ecomeerce_ui/Model/fruit_model.dart';
import 'package:flutter/material.dart';

class TabbarProduct extends StatelessWidget {
  final FruitModel product;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;

  const TabbarProduct({
    super.key,
    required this.product,
    required this.isFavorite,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 243, 207),
        borderRadius: BorderRadius.circular(20),
      ),
child: Stack(
        children: [
          Positioned.fill(
            top: 10,
            bottom: 60,
            child: Center(
              child: Image.asset(
                product.image,
                width: 80,
                height: 80,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            top: -5,
            right: 1,
            child: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.orange : Colors.black,
                size: 24,
              ),
              onPressed: onFavoritePressed,
                 ),
          ),
          Positioned(
            bottom: 5,
            left: 1,
            right: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style:  TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                  ),
                    Text(
                      product.price,
                      style: const TextStyle(
                        color: Colors.orange,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundColor: Colors.orange,
                  radius: 15,
                  child: IconButton(
                    onPressed: () {},
                    icon:  Icon(Icons.add, color: Colors.white),
                    iconSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
     ),
);
}
}