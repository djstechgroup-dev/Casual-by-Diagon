import 'package:casualapp/Screens/UserProfileScreen/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class GamePlayScreen extends StatefulWidget {
  const GamePlayScreen({Key? key}) : super(key: key);

  @override
  State<GamePlayScreen> createState() => _GamePlayScreenState();
}

class _GamePlayScreenState extends State<GamePlayScreen> {
  double screenWidth = 0;
  double screenHeight = 0;

  double borderRadius = 0;

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
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
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
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth / 20,
          vertical: 8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Feedback.forTap(context);

                },
                child: Image.asset(
                  "assets/images/button_back.png",
                  height: 20,
                ),
              ),
            ),
            Expanded(
              child: Hero(
                tag: 'money_coin',
                child: Container(
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
                          const DefaultTextStyle(
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            child: Text(
                              "500",
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
                          const DefaultTextStyle(
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            child: Text(
                              "500",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Hero(
                tag: 'profile_level',
                child: GestureDetector(
                  onTap: () {
                    Feedback.forTap(context);
                    Navigator.of(context).push(
                      PageTransition(
                        child: const UserProfileScreen(),
                        type: PageTransitionType.rightToLeft,
                      ),
                    );
                  },
                  child: Image.asset(
                    "assets/images/game_home_screen/img_level.png",
                    height: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
