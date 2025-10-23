
import 'package:ecomeerce_ui/Model/fruit_model.dart';
import 'package:ecomeerce_ui/Provider/favourite_provider.dart';
import 'package:ecomeerce_ui/Screens/favourite_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatefulWidget {
  final String firstName;
  const HomeScreen({super.key, required this.firstName});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  

///////////////==================[ Fruits Item access] ==========================///////////  
  final List<FruitModel> fruits =[
    FruitModel(
      name: "Honey Lime Combo",
      price: "₦ 2,000", 
      image: "assets/images/Honey_lime.png"
      ),
      FruitModel(
      name: "Berry Mango Combo", 
      price: "₦ 8,000", 
      image: "assets/images/Glowing-Berry-Fruit-Salad.png"
      ),
  ];
  
  @override
  Widget build(BuildContext context) {
     final favProvider = Provider.of<FavoriteProvider>(context);
    final favorites = favProvider.favorites;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(
             horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 44,
              ),


//////////=================  Icons[(Menu , Favorite, Basket)]  ====================================================//////////



              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Positioned(
                    top: 50,
                    left: 20,
                    child: GestureDetector(
                      onTap: (){

                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Icon(
                          Icons.menu_open_outlined,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Positioned(
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> FavoriteScreen()));
                                },
                                child: Icon(Icons.favorite,
                                color: Color(0XFFFFA451),
                                size: 30,
                                                            ),
                              ),
                            ),
                          
                          ),
                          Text("Fav",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                        ],
                      ),
                       Column(
                        children: [
                          Positioned(child: 
                          GestureDetector(
                            onTap: (){
                              
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: Icon(Icons.shopping_basket,
                              color: Color(0XFFFFA451),
                              size: 30,
                              ),
                            ),
                          ),
                          ),
                          Text("My Basket",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),


////////////////////=================== Text==================////////////////////////


            SizedBox(
              height: 15,
            ),
            Text("Hello Tony, What Fruit Salad",
            style: TextStyle(
              fontSize: 20,
              fontFamily: "Brandon Grotesque",
              fontWeight: FontWeight.w400,
              color: Colors.black
            ),
            ),
            SizedBox(
              height: 2,
            ),
             Text("Combo do you want Today?",
            style: TextStyle(
              fontSize: 20,
              fontFamily: "Brandon Grotesque",
              fontWeight: FontWeight.w400,
              color: Colors.black
            ),
            ),
            SizedBox(
              height: 24,
            ),
///////////===================== Search Bar ====================//////////////////////////
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                    color: Color(0XFFF3F4F9),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: " Search for Fruit Salad Combo",
                      hintStyle: TextStyle(
                        color: Colors.grey
                      ),
                      prefixIcon: Icon(Icons.search,
                      size: 20,
                      color: Colors.grey,
                     ),
                     border: InputBorder.none,
                     contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,vertical: 15,
                     )
                    ),
                  ),
              ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey.shade300,width: 1.5),
                ),
                child: Icon(Icons.tune,
                color: Colors.black,
                size: 24,
                ),
              ), 
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Text("Recomeded Combo",
          style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
          ),
          ),
            SizedBox(height: 25),
              

///////////////////=================== Fruit Iteam(Card) ===========================================/////////////////
          

SizedBox(
  height: 190, 
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: fruits.length,
    itemBuilder: (context, index) {
      final fruit = fruits[index];
      return Container(
        margin:  EdgeInsets.only(right: 16),
        width: 170, 
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 8,
              spreadRadius: 3,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                //  Fruit image
                Center(
                  child: CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage(fruit.image),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                //  Favorite icon
                Positioned(
                  right: 5,
                  top: -15,
                    child: IconButton(
                      icon: Icon(
                        fruit.isFavorite?
                        Icons.favorite : Icons.favorite_outline,
                        color: Color(0xffFFA451),
                        size: 24,
                      ), onPressed: () { 
                        favProvider.toggleFavorite(fruit);
                       },
                    ),
                  ),
              ],
            ),

             SizedBox(height: 8),

            //  Fruit name
            Text(
              fruit.name,
              textAlign: TextAlign.center,
              style:  TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2F2E41),
              ),
            ),

             SizedBox(height: 6),

            //  Price + Add button row
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    fruit.price,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffFFA451),
                    ),
                  ),
                  Container(
                    height: 28,
                    width: 28,
                    decoration: BoxDecoration(
                      color:  Color(0xffFFF2E7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child:  Icon(
                      Icons.add,
                      color: Color(0xffFFA451),
                      size: 20,
                                   ),
                                  ),
                                ],
                               ),
                             ),
                           ],
                        ),
                     );
                   },
                 ),
                ),
             ],
            ),
          ),
        ),
      ),
    );
  }
}

