import 'dart:math';

import 'package:casualapp/Model/user_model.dart';
import 'package:casualapp/Screens/GameScreen/game_play_screen.dart';
import 'package:casualapp/Screens/UserProfileScreen/user_profile_screen.dart';
import 'package:casualapp/Widgets/back_button.dart';
import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

class GameRuleScreen extends StatefulWidget {
  const GameRuleScreen({Key? key}) : super(key: key);

  @override
  State<GameRuleScreen> createState() => _GameRuleScreenState();
}

class _GameRuleScreenState extends State<GameRuleScreen> {
  double screenWidth = 0;
  double screenHeight = 0;

  double borderRadius = 0;

  int players = 5420;
  int points = 3450;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        borderRadius = 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF020412),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Hero(
                      tag: '8ball',
                      child: AnimatedContainer(
                        height: screenHeight / 2,
                        curve: Curves.easeInOut,
                        duration: const Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: ExactAssetImage(
                              "assets/images/game_home_screen/img_8_ball.png",
                            ),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(borderRadius),
                            bottomLeft: Radius.circular(borderRadius),
                          ),
                        ),
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: borderRadius > 0 ? 1 : 0,
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 500),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black87,
                                    offset: Offset(0, 4),
                                    blurRadius: 5,
                                  ),
                                ],
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(1000),
                                child: Image.asset(
                                  "assets/images/game_home_screen/game_8_ball_billiard.png",
                                  width: screenWidth / 6,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Billiard Classic",
                                    style: TextStyle(
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        "Amateur",
                                        style: TextStyle(
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                      divider(12, 8),
                                      SizedBox(
                                        width: 35,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            person(15, 10, Random().nextInt(13)),
                                            person(15, 0, Random().nextInt(13)),
                                            person(15, -10, Random().nextInt(13)),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 4,),
                                      Text(
                                        NumberFormat('##,000').format(players).toString(),
                                        style: const TextStyle(
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth / 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenHeight / 28,
                      ),
                      Container(
                        height: 75,
                        width: screenWidth,
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth / 20,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF171B3A),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "High Score",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/user_profile_screen/icon_trophy.png",
                                  height: 15,
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Countup(
                                          begin: 0,
                                          end: points.toDouble(),
                                          duration: const Duration(seconds: 1),
                                          separator: ',',
                                          style: const TextStyle(
                                            fontFamily: "Inter",
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFFFFA800),
                                          ),
                                        ),
                                      ),
                                      const TextSpan(
                                        text: " Points",
                                        style: TextStyle(
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFFFFA800),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenHeight / 18,
                      ),
                      const Text(
                        "RULES: ",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Color(0xFF858CA9),
                        ),
                      ),
                      const SizedBox(height: 8,),
                      const Text(
                        "Correctly pocketing the right balls earn players higher scores. Players earn 80 points for every score up to 240. The number of earned points is equivalent to a player's number of tickets which automatically reflects in the Ticket Vault. More points increases a player's rank in the system.",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xFF858CA9),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight / 14,
                      ),
                      GestureDetector(
                        onTap: () {
                          Feedback.forTap(context);
                          Navigator.of(context).push(
                            PageTransition(
                              child: const GamePlayScreen(),
                              type: PageTransitionType.rightToLeft,
                              curve: Curves.easeInOut,
                              duration: const Duration(milliseconds: 500),
                            ),
                          );
                        },
                        child: Container(
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFF4C27E0),
                                Color(0xFF5F03A7),
                              ],
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "Start Playing",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight / 14,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          topBar(),
        ],
      ),
    );
  }

  Widget topBar() {
    return SafeArea(
      child: Container(
        height: 30,
        width: screenWidth,
        margin: const EdgeInsets.only(
          top: 8,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth / 20,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: CustomBackButton(
                customContext: context,
              ),
            ),
            Hero(
              tag: 'ticket_dgn',
              child: Container(
                height: 30,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.black26,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/icon_ticket.png",
                            height: 14,
                          ),
                          const SizedBox(width: 2,),
                          DefaultTextStyle(
                            style: const TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            child: Text(
                              NumberFormat('##,000').format(UserVariables.userTicket).toString(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 4,),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/icon_dgn.png",
                            height: 20,
                          ),
                          const SizedBox(width: 2,),
                          DefaultTextStyle(
                            style: const TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            child: Text(
                              NumberFormat('##,000').format(UserVariables.userDGN).toString(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Hero(
              tag: 'profile_level',
              child: GestureDetector(
                onTap: () {
                  Feedback.forTap(context);
                  Navigator.of(context).push(
                    PageTransition(
                      child: const UserProfileScreen(),
                      type: PageTransitionType.rightToLeft,
                    ),
                  ).then((value) {
                    setState(() {});
                  });
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 6, //Must same as offset x
                    ),
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        UserVariables.avatarAsset == " " ? Image.asset(
                          "assets/images/signup_screen/icon_person.png",
                          height: 30,
                          fit: BoxFit.fill,
                        ) : Image.asset(
                          UserVariables.avatarAsset,
                          height: 30,
                        ),
                        Transform.translate(
                          offset: const Offset(-6, 0),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                "assets/images/icon_red_circle_outlined.png",
                                height: 12,
                              ),
                              Text(
                                UserVariables.userLevel.toString(),
                                style: const TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 6,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget person(double size, double offsetX, int i) {
    return Container(
      height: size,
      width: size,
      padding: const EdgeInsets.all(1),
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
      transform: Matrix4.translationValues(offsetX, 0, 0),
      child: Image.asset(
        "assets/images/avatars/avatar${i + 1}.png",
      ),
    );
  }

  Widget divider(double height, double margin) {
    return Container(
      height: height,
      width: 1.5,
      margin: EdgeInsets.symmetric(
        horizontal: margin,
      ),
      color: Colors.white.withOpacity(0.2),
    );
  }

}
