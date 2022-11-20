import 'package:casualapp/Widgets/choose_avatar.dart';
import 'package:flutter/material.dart';

class SignUpChooseAvatar extends StatefulWidget {
  const SignUpChooseAvatar({Key? key}) : super(key: key);

  @override
  State<SignUpChooseAvatar> createState() => _SignUpChooseAvatarState();
}

class _SignUpChooseAvatarState extends State<SignUpChooseAvatar> {
  double screenWidth = 0;
  double screenHeight = 0;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF020412),
      body: SafeArea(
        child: Stack(
          children: const [
            Padding(
              padding: EdgeInsets.only(
                top: 50,
              ),
              child: ChooseAvatar(),
            ),
          ],
        ),
      ),
    );
  }
}
