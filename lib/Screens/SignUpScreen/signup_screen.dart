import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  double screenWidth = 0;
  double screenHeight = 0;
  double bottomInset = 0;

  int _screenState = 0;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    bottomInset = MediaQuery.of(context).viewInsets.bottom;

    late Widget body;

    body = Stack(
      children: [
        AnimatedContainer(
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 500),
          transform: Matrix4.translationValues(_screenState == 0 ? screenWidth : 0, 0, -1.0),
          child: AnimatedOpacity(
            opacity: _screenState == 0 ? 0 : 1,
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 500),
            child: signUpScreenNextState(),
          ),
        ),
        AnimatedContainer(
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 500),
          transform: Matrix4.translationValues(_screenState == 1 ? -screenWidth : 0, 0, -1.0),
          child: AnimatedOpacity(
            opacity: _screenState == 1 ? 0 : 1,
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 1000),
            child: signUpScreenCreateProfileState(),
          ),
        ),
      ],
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50,
              width: screenWidth,
              child: Stack(
                children: [
                  Center(
                    child: AnimatedContainer(
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 500),
                      transform: Matrix4.translationValues(0, _screenState == 0 ? 0 : -100, -1.0),
                      child: appBarTitle("Create Profile"),
                    ),
                  ),
                  Center(
                    child: AnimatedContainer(
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 500),
                      transform: Matrix4.translationValues(0, _screenState == 1 ? 0 : -100, -1.0),
                      child: appBarTitle("Sign Up"),
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
                        if(_screenState == 0) {
                          Navigator.pop(context);
                        } else {
                          setState(() {
                            _screenState = 0;
                          });
                        }
                      },
                      child: Image.asset(
                        "assets/images/button_back.png",
                        width: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body,
          ],
        ),
      ),
    );
  }

  Widget signUpScreenCreateProfileState() {
    return Column(
      children: [
        AnimatedContainer(
          height: bottomInset > 0 ? screenHeight / 20 : screenHeight / 8,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        ),
        GestureDetector(
          onTap: () {
            Feedback.forTap(context);
          },
          child: Image.asset(
            "assets/images/signup_screen/icon_person_with_camera.png",
            width: screenWidth / 3,
          ),
        ),
        AnimatedContainer(
          height: bottomInset > 0 ? screenHeight / 20 : screenHeight / 8,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        ),
        container(
          0,
          "",
          "First name",
          [Colors.white, Colors.white],
        ),
        AnimatedContainer(
          height: bottomInset > 0 ? 15 : 30,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        ),
        container(
          0,
          "",
          "Last name",
          [Colors.white, Colors.white],
        ),
        AnimatedContainer(
          height: bottomInset > 0 ? 0 : 30,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        ),
        GestureDetector(
          onTap: () {
            Feedback.forTap(context);
            setState(() {
              _screenState = 1;
            });
          },
          child: container(
            2, "",
            "Next",
            [const Color(0xFFFF0000), const Color(0xFFFF6767)],
          ),
        ),
      ],
    );
  }

  Widget signUpScreenNextState() {
    return Column(
      children: [
        AnimatedContainer(
          height: bottomInset > 0 ? screenHeight / 20 : screenHeight / 8,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        ),
        GestureDetector(
          onTap: () {
            Feedback.forTap(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/signup_screen/icon_person.png",
                width: screenWidth / 11,
              ),
              const SizedBox(width: 12,),
              const Text(
                "Name Surname",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        AnimatedContainer(
          height: bottomInset > 0 ? screenHeight / 20 : screenHeight / 8,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        ),
        container(
          1,
          "assets/images/signup_screen/icon_email_outlined.png",
          "Email",
          [Colors.white, Colors.white],
        ),
        AnimatedContainer(
          height: bottomInset > 0 ? 15 : 30,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        ),
        container(
          1,
          "assets/images/signup_screen/icon_password_outlined.png",
          "Password",
          [Colors.white, Colors.white],
        ),
        const SizedBox(height: 15,),
        const Text(
          "· Password must be at least 5 characters",
          style: TextStyle(
            fontFamily: "Inter",
            fontWeight: FontWeight.w500,
            fontSize: 13,
            color: Colors.white,
          ),
        ),
        AnimatedContainer(
          height: bottomInset > 0 ? 0 : 30,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        ),
        GestureDetector(
          onTap: () {
            Feedback.forTap(context);
            Navigator.pop(context);
          },
          child: container(
            2, "",
            "Next",
            [const Color(0xFFFF0000), const Color(0xFFFF6767)],
          ),
        ),
      ],
    );
  }

  Widget container(int options, String asset, String text, List<Color> color) {
    //Options 0 for text field without icon, 1 for text field, 2 for buttons
    return AnimatedContainer(
      height: text.contains('Next') ? (bottomInset > 0 ? 0 : 60) : 60,
      width: screenWidth,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
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
      child: options < 2 ? (options == 0 ? Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth / 18,
          ),
          child: TextFormField(
            controller: text == "Email" ? emailController : passwordController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: text,
            ),
          ),
        ),
      ) : Row(
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
      )) : Center(
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

  Widget appBarTitle(String text) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Inter",
        fontSize: screenWidth / 20,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    );
  }

}
