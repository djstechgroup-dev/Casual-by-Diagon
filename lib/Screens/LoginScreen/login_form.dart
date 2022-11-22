import 'package:casualapp/Screens/LoginScreen/login_screen.dart';
import 'package:casualapp/Screens/SignUpScreen/signup_screen.dart';
import 'package:casualapp/Screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  double screenWidth = 0;
  double screenHeight = 0;
  double bottomInset = 0;

  bool errorEmail = false;
  bool errorPassword = false;
  bool startExitAnimation = false;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    bottomInset = MediaQuery.of(context).viewInsets.bottom;

    List<Widget> loginFormWidgetList = [
      //TEXT FIELDS
      Container(
        margin: const EdgeInsets.only(bottom: 14),
        child: field(0, "Email is not exist"),
      ),
      Container(
        margin: const EdgeInsets.only(bottom: 14),
        child: field(1, "Password incorrect"),
      ),
      //LOGIN BUTTON
      GestureDetector(
        onTap: () {
          Feedback.forTap(context);
          String email = emailController.text.trim();
          String password = passwordController.text;

          if(email.isEmpty) {
            setState(() {
              errorEmail = true;
            });

            Future.delayed(const Duration(seconds: 3), () {
              setState(() {
                errorEmail = false;
              });
            });
          } else if(password.isEmpty) {
            setState(() {
              errorPassword = true;
            });

            Future.delayed(const Duration(seconds: 3), () {
              setState(() {
                errorPassword = false;
              });
            });
          } else {
            //Add if password is not correct
            //And if password is correct
            navigateToMainScreen();
          }
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 15),
          child: container(
            1, "",
            "Log In",
            [const Color(0xFF00B2FF), const Color(0xFF013FDF)],
          ),
        ),
      ),
      //FORGOT PASSWORD TEXT
      const Text(
        "Forgot your password?",
        style: TextStyle(
          color: Colors.white,
          fontFamily: "Inter",
          fontWeight: FontWeight.w500,
        ),
      ),
      SizedBox(height: bottomInset > 0 ? 0 : 30,),
      //SIGN UP BUTTON
      GestureDetector(
        onTap: () {
          Feedback.forTap(context);
          Navigator.of(context).push(
            PageTransition(
              child: const SignUpScreen(),
              type: PageTransitionType.rightToLeft,
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOut,
            ),
          );
        },
        child: AnimatedContainer(
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 300),
          child: container(
            1, "",
            "New user? Sign Up",
            [const Color(0xFF56AB2F), const Color(0xFFA8E063)],
          ),
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOut,
              transform: Matrix4.translationValues(0, startExitAnimation ? -screenHeight / 4 : 0, 0),
              height: 50,
              width: screenWidth,
              child: Stack(
                children: [
                  Center(
                    child: Text(
                      "Log in",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: screenWidth / 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(
                      left: screenWidth / 24,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Feedback.forTap(context);
                        Navigator.of(context).pushReplacement(
                          PageTransition(
                            child: const LoginScreen(),
                            type: PageTransitionType.fade,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          ),
                        );
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                          color: Colors.black26,
                          shape: BoxShape.circle,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/icon_back_arrow.png",
                              width: 12,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              height: bottomInset > 0 ? screenHeight / 25 : screenHeight / 6,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            ),
            for(int i = 0; i < loginFormWidgetList.length; i++)...<Widget>[
              AnimatedContainer(
                duration: Duration(milliseconds: 300 + i * 100),
                curve: Curves.easeInOut,
                transform: Matrix4.translationValues(startExitAnimation ? -screenWidth : 0, 0, 0),
                child: loginFormWidgetList[i],
              ),
            ],
          ],
        ),
      ),
    );
  }

  void navigateToMainScreen() async {
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      startExitAnimation = true;
    });

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(
        PageTransition(
          child: const MainScreen(),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        ),
      );
    });
  }

  Widget field(int options, String text) {
    return Column(
      children: [
        options == 0 ? container(
          0,
          "assets/images/signup_screen/icon_email_outlined.png",
          "Email",
          [Colors.white, Colors.white],
        ) : container(
          0,
          "assets/images/signup_screen/icon_password_outlined.png",
          "Password",
          [Colors.white, Colors.white],
        ),
        AnimatedOpacity(
          opacity: options == 0 ? (errorEmail ? 1 : 0) : (errorPassword ? 1 : 0),
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
          child: Padding(
            padding: EdgeInsets.only(
              top: 5,
              left: screenWidth / 18 + 4,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                text,
                style: const TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w500,
                  fontSize: 11,
                  color: Color(0xFF5F5F5F),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget container(int options, String asset, String text, List<Color> color) {
    //Options 0 for text field, 1 for buttons
    return AnimatedContainer(
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 300),
      height: text.contains('Sign Up') ? (bottomInset > 0 ? 0 : 60) : 60,
      width: screenWidth,
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth / 18,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        gradient: LinearGradient(
          colors: color,
        ),
      ),
      child: options == 0 ? Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Image.asset(
                asset,
                width: 21,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: TextFormField(
              controller: text == "Email" ? emailController : passwordController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: text,
              ),
            ),
          ),
        ],
      ) : Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Inter",
            fontWeight: FontWeight.w700,
            fontSize: screenWidth / 24,
          ),
        ),
      ),
    );
  }
}
