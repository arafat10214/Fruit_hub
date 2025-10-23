
import 'package:ecomeerce_ui/Screens/Authentication.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 520,
              width: double.maxFinite,
              decoration: BoxDecoration(color: Color(0xffffa451)),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 155,
                    left: 35,
                    child: Image.asset(
                      "assets/images/fruit_one.png",
                      height: 260,
                      width: 301,
                    ),
                  ),
                  Positioned(
                    top: 131,
                    left: 287,
                    child: Image.asset(
                      "assets/images/Small_fruit.png",
                      height: 38,
                      width: 50,
                    ),
                  ),
                  SizedBox(height: 8),

                  Positioned(
                    top: 423,
                    left: 40,
                    child: Image.asset(
                      "assets/images/Shadow.png",
                      height: 12,
                      width: 301,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 56),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "    Get The Freshest Fruit Salad Combo",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Brandon Grotesque",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "     We deliver the best and freshest fruit salad in \n    town.Order for a combo today!!!",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Brandon Grotesque",
                      color: Color(0xff5D577E),
                    ),
                  ),
                  SizedBox(height: 80),
                  Center(
                    child: SizedBox(
                      height: 56,
                      width: 354,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Authentication()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffffa451),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Text("Let's Continue",style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Brandon Grotesque",
                          color: Colors.white,
                        ),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
