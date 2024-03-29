import 'package:casualapp/Screens/LoginScreen/login_form.dart';
import 'package:casualapp/Screens/SignUpScreen/signup_screen.dart';
import 'package:casualapp/Screens/UpdateScreen/update_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  double screenWidth = 0;
  double screenHeight = 0;

  bool toggleEnterAnimation = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 300), () {
        setState(() {
          toggleEnterAnimation = true;
        });

        Future.delayed(const Duration(seconds: 4), () {
          if(mounted) {
            Navigator.of(context).push(
              PageTransition(
                child: const UpdateScreen(),
                type: PageTransitionType.scale,
                alignment: Alignment.center,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              ),
            );
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    late Widget body;

    body = loginScreenStateFirst();

    return Scaffold(
      backgroundColor: const Color(0xFF020412),
      body: body,
    );
  }

  Widget loginScreenStateFirst() {
    return Stack(
      children: [
        AnimatedOpacity(
          opacity: toggleEnterAnimation ? 1 : 0,
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 600),
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/login_screen/bg.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        AnimatedContainer(
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 1000),
          transform: Matrix4.translationValues(0, toggleEnterAnimation ? 0 : -screenHeight / 2, 0),
          margin: EdgeInsets.only(
            top: screenHeight / 6.5,
          ),
          alignment: Alignment.topCenter,
          child: Image.asset(
            "assets/images/login_screen/text.png",
            width: screenWidth / 1.2,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Feedback.forTap(context);
                  Navigator.of(context).push(
                    PageTransition(
                      child: const SignUpScreen(),
                      type: PageTransitionType.rightToLeft,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    ),
                  );
                },
                child: button(0, "Create Account", 800),
              ),
              const SizedBox(height: 16,),
              GestureDetector(
                onTap: () {
                  Feedback.forTap(context);
                  Navigator.of(context).pushReplacement(
                    PageTransition(
                      child: const LoginForm(),
                      type: PageTransitionType.rightToLeft,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    ),
                  );
                },
                child: button(1, "Login with Email", 1000),
              ),
              SizedBox(height: screenHeight / 12,),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageTransition(
                      child: const UpdateScreen(),
                      type: PageTransitionType.topToBottom,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    ),
                  );
                },
                child: AnimatedOpacity(
                  opacity: toggleEnterAnimation ? 1 : 0,
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 1500),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth / 12,
                    ),
                    child: RichText(
                      text: const TextSpan(
                        text: "By continuing, you agree that you are 18+ years old and you accept our ",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 11,
                          color: Color(0xFF5C617A),
                        ),
                        children: [
                          TextSpan(
                            text: "Terms & Conditions",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(
                            text: " and ",
                          ),
                          TextSpan(
                            text: "Privacy Policy",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight / 12,),
            ],
          ),
        ),
      ],
    );
  }

  Widget button(int options, String text, int duration) {
    return AnimatedContainer(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: duration),
      transform: Matrix4.translationValues(0, toggleEnterAnimation ? 0 : screenHeight / 2, 0),
      height: 55,
      width: screenWidth,
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth / 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white,
          width: 1.5,
        ),
        color: Colors.white.withOpacity(options == 0 ? 1 : 0.15),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontFamily: "Inter",
            fontWeight: FontWeight.w600,
            color: options == 0 ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
