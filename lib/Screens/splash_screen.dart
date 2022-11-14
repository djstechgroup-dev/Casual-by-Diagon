import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool toggle = false;

  double screenWidth = 0;
  double screenHeight = 0;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/splash_screen/bg.png",
              fit: BoxFit.fill,
            ),
          ),
          Positioned.fill(
            child: Image.asset(
              "assets/images/splash_screen/img.png",
              fit: BoxFit.fill,
            ),
          ),
          Positioned.fill(
            child: Image.asset(
              "assets/images/splash_screen/fade.png",
              fit: BoxFit.fill,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                toggle = !toggle;
              });
            },
            child: toggle ? Center(
              child: Image.asset(
                "assets/images/logo_glow.png",
              ),
            ) : Center(
              child: Text(
                "CASUAL",
                style: TextStyle(
                  fontFamily: "Monument",
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  fontSize: screenWidth / 10,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: screenHeight / 15,
            ),
            alignment: Alignment.bottomCenter,
            child: RichText(
              text: TextSpan(
                text: "By ",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1,
                  fontSize: screenWidth / 35,
                ),
                children: const [
                  TextSpan(
                    text: "DIAGON",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
