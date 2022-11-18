import 'package:casualapp/Model/user_model.dart';
import 'package:casualapp/Screens/AvatarScreen/choose_avatar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pinput/pinput.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  double screenWidth = 0;
  double screenHeight = 0;
  double bottomInset = 0;

  bool error1 = false;
  bool error2 = false;

  String avatarAsset = " ";

  int screenState = 0;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    bottomInset = MediaQuery.of(context).viewInsets.bottom;

    late Widget body;

    body = Column(
      children: [
        Stack(
          children: [
            //Screen state 3
            AnimatedContainer(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 500),
              transform: Matrix4.translationValues(screenState < 3 ? (screenState <= 2 ? screenWidth : -screenWidth) : 0, 0, -1.0),
              child: AnimatedOpacity(
                opacity: screenState == 0 ? 0 : 1,
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 500),
                child: signUpScreenPinState(),
              ),
            ),
            //Screen state 2
            AnimatedContainer(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 500),
              transform: Matrix4.translationValues(screenState != 2 ? (screenState <= 1 ? screenWidth : -screenWidth) : 0, 0, -1.0),
              child: AnimatedOpacity(
                opacity: screenState == 0 ? 0 : 1,
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 500),
                child: signUpScreenEmailState(),
              ),
            ),
            //Screen state 1
            AnimatedContainer(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 500),
              transform: Matrix4.translationValues(screenState != 1 ? (screenState <= 0 ? screenWidth : -screenWidth) : 0, 0, -1.0),
              child: AnimatedOpacity(
                opacity: screenState != 1 ? 0 : 1,
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 1000),
                child: signUpScreenCreateProfileState(),
              ),
            ),
            //Screen state 0
            AnimatedContainer(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 500),
              transform: Matrix4.translationValues(screenState == 0 ? 0 : -screenWidth, 0, -1.0),
              child: AnimatedOpacity(
                opacity: screenState > 0 ? 0 : 1,
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 1000),
                child: signUpScreenUsernameState(),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Feedback.forTap(context);
            switch(screenState) {
              case 0:
                if(usernameController.text.isEmpty) {
                  setState(() {
                    error1 = true;
                  });

                  Future.delayed(const Duration(seconds: 3), () {
                    setState(() {
                      error1 = false;
                    });
                  });
                } else {
                  setState(() {
                    UserVariables.username = usernameController.text;
                    screenState += 1;
                  });
                }
                break;
              case 1:
                if(firstNameController.text.isEmpty) {
                  setState(() {
                    error1 = true;
                  });

                  Future.delayed(const Duration(seconds: 3), () {
                    setState(() {
                      error1 = false;
                    });
                  });
                } else if(lastNameController.text.isEmpty) {
                  setState(() {
                    error2 = true;
                  });

                  Future.delayed(const Duration(seconds: 3), () {
                    setState(() {
                      error2 = false;
                    });
                  });
                } else {
                  setState(() {
                    UserVariables.firstName = firstNameController.text;
                    UserVariables.lastName = lastNameController.text;
                    screenState += 1;
                  });
                }
                break;
              case 2:
                if(emailController.text.isEmpty) {
                  setState(() {
                    error1 = true;
                  });

                  Future.delayed(const Duration(seconds: 3), () {
                    setState(() {
                      error1 = false;
                    });
                  });
                } else if(passwordController.text.isEmpty) {
                  setState(() {
                    error2 = true;
                  });

                  Future.delayed(const Duration(seconds: 3), () {
                    setState(() {
                      error2 = false;
                    });
                  });
                } else {
                  setState(() {
                    screenState += 1;
                  });
                }
                break;
              case 3:
                //submit function
                break;
            }
          },
          child: Hero(
            tag: 'nextButton',
            child: container(
              2, "",
              screenState < 3 ? "Next" : "Submit",
              [const Color(0xFFFF0000), const Color(0xFFFF6767)],
              usernameController,
            ),
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
                      transform: Matrix4.translationValues(0, screenState < 2 ? 0 : -100, -1.0),
                      child: appBarTitle("Create Profile"),
                    ),
                  ),
                  Center(
                    child: AnimatedContainer(
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 500),
                      transform: Matrix4.translationValues(0, screenState >= 2 ? 0 : -100, -1.0),
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
                        if(screenState > 0) {
                          setState(() {
                            screenState -= 1;
                          });
                        } else {
                          Navigator.pop(context);
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

  Widget signUpScreenUsernameState() {
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
            Navigator.of(context).push(
              PageTransition(
                child: const ChooseAvatar(),
                type: PageTransitionType.scale,
                alignment: Alignment.center,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut
              ),
            ).then((value) {
              //Refresh image
              setState(() {});
            });
          },
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              UserVariables.avatarAsset == " " ? Image.asset(
                "assets/images/signup_screen/icon_person.png",
                width: screenWidth / 3,
                fit: BoxFit.fill,
              ) : Image.asset(
                UserVariables.avatarAsset,
                width: screenWidth / 3,
              ),
              Transform.translate(
                offset: const Offset(-16, 0),
                child: Image.asset(
                  "assets/images/signup_screen/icon_camera.png",
                  width: (screenWidth / 3) / 3,
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
          0,
          "",
          "Username",
          [Colors.white, Colors.white],
          usernameController,
        ),
        helperTextForField(
          0, "Username can not be empty!",
        ),
        AnimatedContainer(
          height: bottomInset > 0 ? 0 : 19,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        ),
      ],
    );
  }

  Widget signUpScreenCreateProfileState() {
    return Column(
      children: [
        AnimatedContainer(
          height: bottomInset > 0 ? screenHeight / 20 : screenHeight / 10,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        ),
        GestureDetector(
          onTap: () {
            Feedback.forTap(context);
          },
          child: UserVariables.avatarAsset == " " ? Image.asset(
            "assets/images/signup_screen/icon_person.png",
            width: screenWidth / 3,
          ) : Image.asset(
            UserVariables.avatarAsset,
            width: screenWidth / 3,
          ),
        ),
        AnimatedContainer(
          height: bottomInset > 0 ? screenHeight / 20 : screenHeight / 10,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        ),
        container(
          0,
          "",
          "First name",
          [Colors.white, Colors.white],
          firstNameController,
        ),
        helperTextForField(
          0, "First name can not be empty!",
        ),
        AnimatedContainer(
          height: bottomInset > 0 ? 4 : 19,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        ),
        container(
          0,
          "",
          "Last name",
          [Colors.white, Colors.white],
          lastNameController,
        ),
        helperTextForField(
          1, "Last name can not be empty!",
        ),
        AnimatedContainer(
          height: bottomInset > 0 ? 0 : 19,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        ),
      ],
    );
  }

  Widget signUpScreenEmailState() {
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
              UserVariables.avatarAsset == " " ? Image.asset(
                "assets/images/signup_screen/icon_person.png",
                width: screenWidth / 11,
              ) : Image.asset(
                UserVariables.avatarAsset,
                width: screenWidth / 11,
              ),
              const SizedBox(width: 12,),
              Text(
                usernameController.text,
                style: const TextStyle(
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
          emailController,
        ),
        helperTextForField(
          0, "Email can not be empty!",
        ),
        AnimatedContainer(
          height: bottomInset > 0 ? 4 : 19,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        ),
        container(
          1,
          "assets/images/signup_screen/icon_password_outlined.png",
          "Password",
          [Colors.white, Colors.white],
          passwordController,
        ),
        helperTextForField(
          1, "Password can not be empty!",
        ),
        const SizedBox(height: 4,),
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
      ],
    );
  }

  Widget signUpScreenPinState() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedContainer(
          height: bottomInset > 0 ? screenHeight / 20 : screenHeight / 8,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        ),
        const Text(
          "Enter 6 digit Code sent to your email",
          style: TextStyle(
            fontFamily: "Inter",
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        AnimatedContainer(
          height: bottomInset > 0 ? 15 : 30,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        ),
        Pinput(
          length: 6,
          closeKeyboardWhenCompleted: true,
          defaultPinTheme: PinTheme(
            width: screenWidth / 8,
            height: screenWidth / 8,
            textStyle: const TextStyle(
              fontFamily: "Inter",
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onCompleted: (pin) => print(pin),
        ),
      ],
    );
  }

  Widget container(int options, String asset, String text, List<Color> color, TextEditingController controller) {
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
            controller: controller,
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

  Widget helperTextForField(int index, String text) {
    return AnimatedOpacity(
      opacity: index == 0 ? (error1 ? 1 : 0) : (error2 ? 1 : 0),
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
