import 'package:casualapp/Model/user_model.dart';
import 'package:casualapp/Screens/GameScreen/game_home_screen.dart';
import 'package:casualapp/Screens/LeaderboardScreen/leaderboard_screen.dart';
import 'package:casualapp/Screens/LotteryScreen/lottery_screen.dart';
import 'package:casualapp/Screens/TransactionScreen/transactions_screen.dart';
import 'package:casualapp/Screens/UserProfileScreen/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double screenWidth = 0;
  double screenHeight = 0;

  int selectedScreen = 0;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    late Widget body;

    switch(selectedScreen) {
      case 0:
        body = const GameHomeScreen();
        break;
      case 1:
        body = const LotteryScreen();
        break;
      case 2:
        body = const LeaderboardScreen();
        break;
      case 3:
        body = const TransactionsScreen();
        break;
      default:
        body = const GameHomeScreen();
        break;
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Stack(
            children: [
              body,
            ],
          ),
          //App Bar
          topBar(),
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
                  bottomNavItem(1, "icon_raffle", "Raffle Draw"),
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
            Hero(
              tag: 'ticket_dgn',
              child: Container(
                height: 30,
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
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
                              fontSize: 13,
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
                              fontSize: 13,
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
          ],
        ),
      ),
    );
  }

  Widget bottomNavItem(int index, String asset, String text) {
    return Container(
      padding: EdgeInsets.only(
        right: index != 3 ? screenWidth / 14 : 0,
      ),
      child: GestureDetector(
        onTap: () {
          Feedback.forTap(context);
          setState(() {
            selectedScreen = index;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: selectedScreen == index ? 1 : 0.4,
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 500),
              child: Image.asset(
                "assets/images/game_home_screen/$asset.png",
                height: 22,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4,),
            AnimatedOpacity(
              opacity: selectedScreen == index ? 1 : 0.2,
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 300),
              child: Text(
                text,
                style: const TextStyle(
                  fontFamily: "Inter",
                  fontSize: 8,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
