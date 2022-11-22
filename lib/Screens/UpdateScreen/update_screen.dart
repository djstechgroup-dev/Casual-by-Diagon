import 'package:flutter/material.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  double screenWidth = 0;
  double screenHeight = 0;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF020412),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: screenWidth / 18,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 16,),
              GestureDetector(
                onTap: () {
                  Feedback.forTap(context);
                  Navigator.pop(context);
                },
                child: Image.asset(
                  "assets/images/button_close.png",
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight / 20,
                  ),
                  child: Text(
                    "Get the Latest Version of the App",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w700,
                      fontSize: screenWidth / 15,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth / 20,
                  ),
                  child: const Text(
                    "To ensure maximum security, we need you to update your app to the latest version to continue using it.",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight / 8,
                  ),
                  child: Image.asset(
                    "assets/images/update_screen/icon_bell_with_1.png",
                    width: screenWidth / 2,
                  ),
                ),
              ),
              button("Update Now",),
            ],
          ),
        ),
      ),
    );
  }

  Widget button(String text) {
    return Container(
      height: 60,
      width: screenWidth,
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth / 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFF0000),
            Color(0xFFFF6767),
          ]
        )
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: "Inter",
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

}
