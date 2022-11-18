import 'dart:math';

import 'package:casualapp/Screens/GameScreen/game_rule_screen.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

class GameHomeScreen extends StatefulWidget {
  const GameHomeScreen({Key? key}) : super(key: key);

  @override
  State<GameHomeScreen> createState() => _GameHomeScreenState();
}

class _GameHomeScreenState extends State<GameHomeScreen> {
  double screenWidth = 0;
  double screenHeight = 0;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF020412),
      body: Stack(
        children: [
          //Content
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: Image.asset(
                        "assets/images/game_home_screen/top_bg_blur.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: screenHeight / 8,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              PageTransition(
                                type: PageTransitionType.fade,
                                child: const GameRuleScreen(),
                                duration: const Duration(milliseconds: 800),
                                curve: Curves.easeInOut,
                              ),
                            );
                          },
                          child: Hero(
                            tag: '8ball',
                            child: Image.asset(
                              "assets/images/game_home_screen/img_8_ball.png",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth / 20,
                    top: 30,
                  ),
                  child: Column(
                    children: [
                      heading("Top Games"),
                      const SizedBox(height: 12,),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            topGames("game_totemia"),
                            topGames("game_3d_chess"),
                            topGames("game_archery"),
                            topGames("game_8_ball_billiard"),
                            topGames("game_city_dunk"),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth / 20,
                    top: 30,
                  ),
                  child: Column(
                    children: [
                      heading("Daily Challenge"),
                      const SizedBox(height: 12,),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            dailyChallenge("game_city_dunk", "CITY DUNK", 5000),
                            dailyChallenge("game_8_ball_billiard", "8 BALL", 1000),
                            dailyChallenge("game_endless_truck", "ENDLESS TRUCK", 200),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth / 20,
                    top: 30,
                  ),
                  child: Column(
                    children: [
                      heading("Tournaments"),
                      const SizedBox(height: 20,),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            tournament("img_table_tennis", "Table Tennis", "Closed", 12),
                            tournament("img_table_tennis", "Table Tennis", "Open", 5),
                            tournament("img_table_tennis", "Table Tennis", "Closed", 8),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth / 20,
                    right: screenWidth / 20,
                    top: 30,
                  ),
                  child: Column(
                    children: [
                      heading("All Games"),
                      const SizedBox(height: 20,),
                      allGamesItem("game_city_dunk", "City Dunk", 5443),
                      divider(),
                      allGamesItem("game_archery", "Archery", 4563),
                      divider(),
                      allGamesItem("game_8_ball_billiard", "Billiards Classic", 3820),
                      divider(),
                      allGamesItem("game_endless_truck", "Endless Truck", 2342),
                      divider(),
                      allGamesItem("game_totemia", "Cursed Marbles", 1230),
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/button_arrow_right.png",
                            width: 16,
                          ),
                          const SizedBox(width: 6,),
                          const Text(
                            "See more",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12,),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth / 20,
                    top: 30,
                  ),
                  child: Column(
                    children: [
                      heading("Don't Miss Out"),
                      const SizedBox(height: 20,),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            earnTokens(),
                            earnTokens(),
                            earnTokens(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 120,),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget heading(String text) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: "Inter",
          fontWeight: FontWeight.w800,
          fontSize: screenWidth / 16,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget topGames(String asset) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 12,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          "assets/images/game_home_screen/$asset.png",
          height: screenWidth / 3,
        ),
      ),
    );
  }

  Widget dailyChallenge(String asset, String text, int players) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 12,
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              "assets/images/game_home_screen/$asset.png",
              height: screenWidth / 3,
            ),
          ),
          const SizedBox(height: 8,),
          Text(
            text,
            style: const TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 35,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    person(15, 10, Random().nextInt(13) + 1),
                    person(15, 0, Random().nextInt(13) + 1),
                    person(15, -10, Random().nextInt(13) + 1),
                  ],
                ),
              ),
              const SizedBox(width: 2,),
              Text(
                NumberFormat('##,000').format(players).toString(),
                style: const TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget tournament(String assetBigImage, String name, String status, int playing) {
    return Container(
      height: screenWidth / 1.8,
      width: screenWidth / 1.2,
      margin: const EdgeInsets.only(right: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          children: [
            Image.asset(
              "assets/images/game_home_screen/$assetBigImage.png",
              fit: BoxFit.fill,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GlassContainer.clearGlass(
                height: 85,
                width: screenWidth / 1.2,
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth / 20,
                ),
                borderColor: Colors.white.withOpacity(0.12),
                gradient: RadialGradient(
                  radius: 2,
                  colors: [
                    const Color(0xFF4A4A4A).withOpacity(0.05),
                    Colors.white.withOpacity(0.12),
                  ],
                ),
                borderWidth: 1,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          status,
                          style: const TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 20,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEB4F47),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Center(
                            child: Text(
                              "LIVE",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "$playing playing",
                          style: const TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "1st Prize",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Color(0xFF292929),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "assets/images/icon_ticket.png",
                          height: 20,
                        ),
                        const Text(
                          "100",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                            color: Color(0xFF292929),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget earnTokens() {
    return Padding(
      padding: const EdgeInsets.only(
        right: 12,
      ),
      child: Image.asset(
        "assets/images/game_home_screen/img_token_earn.png",
        width: screenWidth / 1.2,
      ),
    );
  }

  Widget allGamesItem(String asset, String title, int players) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              "assets/images/game_home_screen/$asset.png",
              width: screenWidth / 4,
            ),
            const SizedBox(width: 12,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: screenWidth / 4,
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 43,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          person(17, 13, Random().nextInt(13) + 1),
                          person(17, 0, Random().nextInt(13) + 1),
                          person(17, -13, Random().nextInt(13) + 1),
                        ],
                      ),
                    ),
                    const SizedBox(width: 4,),
                    Text(
                      NumberFormat('##,000').format(players).toString(),
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Container(
          height: 48,
          width: screenWidth / 4,
          decoration: BoxDecoration(
            color: const Color(0xFF00B669),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Text(
              "PLAY",
              style: TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget divider() {
    return Container(
      height: 1,
      width: screenWidth,
      margin: EdgeInsets.symmetric(
        vertical: screenWidth / 22,
      ),
      color: const Color(0xFF171B3A),
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
        "assets/images/avatars/avatar$i.png",
      ),
    );
  }

}
