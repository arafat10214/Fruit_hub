import 'package:ecomeerce_ui/Screens/Home_screen.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
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
                      "assets/images/fruit_two.png",
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
              padding: EdgeInsetsGeometry.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "   What's Your firstname ?",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Brandon Grotesque",
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(child: Padding(padding: EdgeInsets.all(20),
                  child: TextField(
                    style: TextStyle(
                      height: 2,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF3F1F1),
                      hintText: "Unknown",
                      hintStyle: TextStyle(
                        color: Colors.grey
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      )
                    ),
                  ),
                  ),
                  ),
                  SizedBox(height: 40),
                  Center(
                    child: SizedBox(
                      height: 56,
                      width: 354,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffffa451),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: Text("Start Ordering",style: TextStyle(
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
