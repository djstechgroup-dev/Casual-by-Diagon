import 'package:casualapp/Screens/GameHomeScreen/game_play_screen.dart';
import 'package:flutter/material.dart';
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
      backgroundColor: Colors.black,
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
                                child: const GamePlayScreen(),
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
                            tournament("game_table_tennis", "img_table_tennis", "1m 25s", "24hrs"),
                            tournament("game_table_tennis", "img_table_tennis", "5m 35s", "24hrs"),
                            tournament("game_table_tennis", "img_table_tennis", "10m 15s", "24hrs"),
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
                      allGamesItem("game_8_ball_billiard", "8 Ball", 3820),
                      divider(),
                      allGamesItem("game_endless_truck", "Truck", 2342),
                      divider(),
                      allGamesItem("game_totemia", "Totemia", 1230),
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
                      heading("Earn Tokens"),
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
                    Container(
                      height: 15,
                      width: 15,
                      padding: const EdgeInsets.all(1),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      transform: Matrix4.translationValues(10, 0, 0),
                      child: Image.asset(
                        "assets/images/signup_screen/icon_person.png",
                      ),
                    ),
                    Container(
                      height: 15,
                      width: 15,
                      padding: const EdgeInsets.all(1),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        "assets/images/signup_screen/icon_person.png",
                      ),
                    ),
                    Container(
                      height: 15,
                      width: 15,
                      padding: const EdgeInsets.all(1),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      transform: Matrix4.translationValues(-10, 0, 0),
                      child: Image.asset(
                        "assets/images/signup_screen/icon_person.png",
                      ),
                    ),
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

  Widget tournament(String assetSmallImage, String assetBigImage, String timeLeft, String endsIn) {
    return Container(
      width: screenWidth / 1.2,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
            child: Image.asset(
              "assets/images/game_home_screen/$assetBigImage.png",
            ),
          ),
          Container(
            height: 85,
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth / 30,
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF11998E),
                  Color(0xFF38EF7D),
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/game_home_screen/$assetSmallImage.png",
                  height: 60,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/icon_timer.png",
                          height: 18,
                        ),
                        const SizedBox(width: 6,),
                        Text(
                          timeLeft,
                          style: const TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Ends in $endsIn",
                      style: const TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                        fontSize: 11,
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
    );
  }

  Widget earnTokens() {
    return Padding(
      padding: const EdgeInsets.only(
        right: 12,
      ),
      child: Image.asset(
        "assets/images/game_home_screen/earn_token_img_1.png",
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
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 43,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 17,
                            width: 17,
                            padding: const EdgeInsets.all(1),
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            transform: Matrix4.translationValues(13, 0, 0),
                            child: Image.asset(
                              "assets/images/signup_screen/icon_person.png",
                            ),
                          ),
                          Container(
                            height: 17,
                            width: 17,
                            padding: const EdgeInsets.all(1),
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              "assets/images/signup_screen/icon_person.png",
                            ),
                          ),
                          Container(
                            height: 17,
                            width: 17,
                            padding: const EdgeInsets.all(1),
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            transform: Matrix4.translationValues(-13, 0, 0),
                            child: Image.asset(
                              "assets/images/signup_screen/icon_person.png",
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 4,),
                    Text(
                      NumberFormat('##,000').format(players).toString(),
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
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

}
