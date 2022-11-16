import 'package:flutter/material.dart';

class GameHomeScreen extends StatefulWidget {
  const GameHomeScreen({Key? key}) : super(key: key);

  @override
  State<GameHomeScreen> createState() => _GameHomeScreenState();
}

class _GameHomeScreenState extends State<GameHomeScreen> {
  double screenWidth = 0;
  double screenHeight = 0;

  int _selectedScreen = 0;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Image.asset(
            "assets/images/game_home_screen/top_bg_blur.png",
            fit: BoxFit.fitWidth,
          ),
          //Content
          SingleChildScrollView(
            child: Column(
              children: [
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth / 20,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/images/game_home_screen/img_level.png",
                          height: 30,
                        ),
                        Container(
                          height: 30,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.black26,
                          ),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/icon_coin.png",
                                    height: 14,
                                  ),
                                  const SizedBox(width: 2,),
                                  const Text(
                                    "500",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 4,),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/icon_money.png",
                                    height: 20,
                                  ),
                                  const SizedBox(width: 2,),
                                  const Text(
                                    "500",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: 14,
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
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/images/game_home_screen/img_8_ball.png",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth / 20,
                    top: 16,
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Top Games",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w800,
                            fontSize: screenWidth / 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
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
                    top: 16,
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Daily Challenge",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w800,
                            fontSize: screenWidth / 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12,),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            dailyChallenge("game_city_dunk", "CITY DUNK", 5000),
                            dailyChallenge("game_8_ball_billiard", "8 BALL", 100),
                            dailyChallenge("game_endless_truck", "ENDLESS TRUCK", 20),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 90,),
              ],
            ),
          ),
          //Bottom Navigation Bar
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 75,
              width: screenWidth,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF353951),
                    Color(0xFF06091F),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  bottomNavItem(0, "icon_games", "Games"),
                  bottomNavItem(1, "icon_tournaments", "Tournaments"),
                  bottomNavItem(2, "icon_leaderboard", "Leaderboard"),
                  bottomNavItem(3, "icon_transactions", "Transactions"),
                ],
              ),
            ),
          ),
        ],
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
                players.toString(),
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

  Widget bottomNavItem(int index, String asset, String text) {
    return Padding(
      padding: EdgeInsets.only(
        right: index != 3 ? screenWidth / 14 : 0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/game_home_screen/$asset.png",
            height: 22,
            color: Colors.white.withOpacity(_selectedScreen == index ? 1 : 0.4),
          ),
          const SizedBox(height: 4,),
          Text(
            text,
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 8,
              fontWeight: FontWeight.w600,
              color: Colors.white.withOpacity(_selectedScreen == index ? 1 : 0.2),
            ),
          ),
        ],
      ),
    );
  }

}
