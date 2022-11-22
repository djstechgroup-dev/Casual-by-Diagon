import 'package:casualapp/Widgets/gradient_container.dart';
import 'package:flutter/material.dart';

class UserEnterReferral extends StatelessWidget {
  const UserEnterReferral({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF020412),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: screenWidth / 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/referral_screen/icon_magnet.png",
                    fit: BoxFit.cover,
                    height: screenWidth / 3,
                  ),
                  SizedBox(height: screenHeight / 15,),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Who referred you?",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Color(0xFF858CA9),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8,),
                  GradientContainerWithGradientFill(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth / 20,
                        vertical: 8,
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter username",
                          hintStyle: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Color(0xFF858CA9),
                          ),
                        ),
                        style: const TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF4C27E0),
                          Color(0xFF5F03A7),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              width: screenWidth,
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth / 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Opacity(
                    opacity: 0,
                    child: Image.asset(
                      "assets/images/button_close.png",
                      height: 30,
                    ),
                  ),
                  const Text(
                    "Referral",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Feedback.forTap(context);
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "assets/images/button_close.png",
                      height: 30,
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
