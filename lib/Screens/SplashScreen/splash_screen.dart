import 'package:casualapp/Screens/LoginScreen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool toggle = true;

  double screenWidth = 0;
  double screenHeight = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        toggle = !toggle;
      });

      Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(
          PageTransition(
            child: const LoginScreen(),
            type: PageTransitionType.fade,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
          ),
        );
      });
    });
  }

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
          Center(
            child: AnimatedOpacity(
              opacity: toggle ? 1 : 0,
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 800),
              child: Image.asset(
                "assets/images/logo_glow.png",
              ),
            ),
          ),
          Center(
            child: AnimatedOpacity(
              opacity: toggle ? 0 : 1,
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 800),
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
          AnimatedOpacity(
            opacity: toggle ? 0 : 1,
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 1000),
            child: AnimatedContainer(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 1000),
              margin: EdgeInsets.only(
                bottom: toggle ? 0 : screenHeight / 15,
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
          ),
        ],
      ),
    );
  }
}
