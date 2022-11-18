import 'package:casualapp/Model/user_model.dart';
import 'package:casualapp/Screens/UserProfileScreen/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

class UserHighScores extends StatefulWidget {
  const UserHighScores({Key? key}) : super(key: key);

  @override
  State<UserHighScores> createState() => _UserHighScoresState();
}

class _UserHighScoresState extends State<UserHighScores> {
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
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.all(screenWidth / 20),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: screenWidth / 12,
                    ),
                    child: Text(
                      "High Scores",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w900,
                        fontSize: screenWidth / 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  highscoresListItem("game_archery", "Archery", 19450),
                  highscoresListItem("game_8_ball_billiard", "Billiard Classic", 18210),
                  highscoresListItem("game_knife_rain", "Knife Rain", 245340),
                  highscoresListItem("game_city_dunk", "City Dunk", 192240),
                  highscoresListItem("game_totemia", "Totemia", 1822490),
                  highscoresListItem("game_3d_chess", "3D Chess", 512420),
                  highscoresListItem("game_endless_truck", "Endless Truck", 26270),
                ],
              ),
            ),
            Container(
              height: 50,
              width: screenWidth,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                left: screenWidth / 24,
                right: screenWidth / 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Feedback.forTap(context);
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "assets/images/button_back.png",
                      width: 30,
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
                            curve: Curves.easeInOut,
                            duration: const Duration(milliseconds: 500),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 6, //Must same as offset x
                        ),
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            UserVariables.avatarAsset == " " ? Image.asset(
                              "assets/images/signup_screen/icon_person.png",
                              height: 26,
                              fit: BoxFit.fill,
                            ) : Image.asset(
                              UserVariables.avatarAsset,
                              height: 26,
                              fit: BoxFit.fill,
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
                                  DefaultTextStyle(
                                    style: const TextStyle(
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 6,
                                      color: Colors.white,
                                    ),
                                    child: Text(
                                      UserVariables.userLevel.toString(),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget highscoresListItem(String asset, String game, int score) {
    return Container(
      width: screenWidth,
      padding: EdgeInsets.all(screenWidth / 30),
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF22264E),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/game_home_screen/$asset.png",
            width: screenWidth / 5,
            height: screenWidth / 5,
            fit: BoxFit.fill,
          ),
          SizedBox(width: screenWidth / 30,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                game,
                style: const TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w700,
                  fontSize: 19,
                  color: Colors.white,
                ),
              ),
              Text(
                NumberFormat('##,000').format(score).toString(),
                style: const TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: Color(0xFFFFA722),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

}
