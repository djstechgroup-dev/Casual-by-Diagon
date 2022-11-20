import 'package:flutter/material.dart';

class GamePlayScreen extends StatefulWidget {
  const GamePlayScreen({Key? key}) : super(key: key);

  @override
  State<GamePlayScreen> createState() => _GamePlayScreenState();
}

class _GamePlayScreenState extends State<GamePlayScreen> {
  double screenWidth = 0;
  double screenHeight = 0;

  int score = 1120;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          FittedBox(
            child: Image.asset(
              "assets/images/game_play_screen/blur_bg.png",
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: screenHeight / 2.4,
                  width: screenWidth / 1.4,
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth / 16,
                  ),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white,
                        Color(0xFF8CDC70),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: screenHeight / 2.4 / 9,),
                      const Text(
                        "Game Over!",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w700,
                          fontSize: 26,
                          color: Color(0xFF040F1F),
                        ),
                      ),
                      SizedBox(height: screenHeight / 2.4 / 9,),
                      rowText("Score", score.toString()),
                      rowText("Time", "1:23"),
                      SizedBox(height: screenHeight / 2.4 / 9,),
                      Container(
                        height: screenHeight / 2.2 / 4,
                        width: screenWidth,
                        decoration: BoxDecoration(
                          color: const Color(0xFF040F1F),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Total Score",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8,),
                            Text(
                              score.toString(),
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w700,
                                fontSize: screenHeight / 2.4 / 10,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight / 10,),
                GestureDetector(
                  onTap: () {
                    Feedback.forTap(context);
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 60,
                    width: screenWidth / 2.4,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFFDCC600),
                          Color(0xFF04DC00),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Center(
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget rowText(String text1, String text2) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text1,
              style: const TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Color(0xFF040F1F),
              ),
            ),
            Text(
              text2,
              style: const TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Color(0xFF040F1F),
              ),
            ),
          ],
        ),
        Container(
          height: 1,
          width: screenWidth,
          margin: const EdgeInsets.symmetric(
            vertical: 8,
          ),
          color: const Color(0xFF2F2F2F).withOpacity(0.3),
        ),
      ],
    );
  }

}
