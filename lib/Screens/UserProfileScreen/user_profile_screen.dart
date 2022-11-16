import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  double screenWidth = 0;
  double screenHeight = 0;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(
              left: screenWidth / 24,
            ),
            child: GestureDetector(
              onTap: () {
                Feedback.forTap(context);
                Navigator.pop(context);
              },
              child: Image.asset(
                "assets/images/button_back.png",
                width: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
