import 'package:ecomeerce_ui/Provider/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<FavoriteProvider>(context);
    final favorites = favProvider.favorites;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding:  EdgeInsets.only(top: 40, left: 15, right: 15),
            decoration: const BoxDecoration(
              color: Colors.orange,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding:  EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  ),
                  icon:  Icon(Icons.arrow_back_ios_new, size: 16),
                  label:  Text("Go back"),
                  onPressed: () => Navigator.pop(context),
                ),
                 SizedBox(width: 40),
                 Text(
                  "  My favorite",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
           SizedBox(height: 10),
          Expanded(
            child: favorites.isEmpty
                ?  Center(
                    child: Text("No favorites added yet!",
                        style: TextStyle(fontSize: 16)),
                  )
                : ListView.builder(
                    itemCount: favorites.length,
                    itemBuilder: (context, index) {
                      final fruit = favorites[index];
                      return ListTile(
                        contentPadding:
                             EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        leading: Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            color: Colors.orange.shade50,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding:  EdgeInsets.all(8.0),
                            child: Image.asset(fruit.image, fit: BoxFit.contain),
                          ),
                        ),
                        title: Text(
                          fruit.name,
                          style:  TextStyle(fontWeight: FontWeight.w500),
                        ),
                        trailing: IconButton(
                          icon:  Icon(Icons.favorite, color: Colors.orange,size: 30,),
                          onPressed: () {
                            favProvider.toggleFavorite(fruit);
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
