import 'dart:math';

import 'package:casualapp/Model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:intl/intl.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({Key? key}) : super(key: key);

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  double screenWidth = 0;
  double screenHeight = 0;

  int userPlaceIndex = 0;

  List<String> leaderBoardPlayers = List.generate(
    100, (i) => i == 0 ? "${UserVariables.username};${UserVariables.trophy};${UserVariables.avatarAsset}"
      : "Player ${i + 1};${Random().nextInt(200000)};assets/images/avatars/avatar${Random().nextInt(13) + 1}.png",
  );

  @override
  void initState() {
    super.initState();
    leaderBoardPlayers.sort((a, b) => int.parse(b.split(';')[1]).compareTo(int.parse(a.split(';')[1])));

    for(int i = 0; i < leaderBoardPlayers.length; i++) {
      if(leaderBoardPlayers[i].split(';')[0].contains(UserVariables.username)) {
        setState(() {
          userPlaceIndex = i;
        });
      }
    }
  }

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
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth / 20,
              ),
              child: Column(
                children: [
                  SizedBox(height: screenHeight / 15,),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: screenWidth / 4,
                    ),
                    child: gradientContainer(
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: const Center(
                          child: Text(
                            "Leaderboard",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight / 20,),
                  SizedBox(
                    width: screenWidth,
                    child: ListView(
                      primary: false,
                      shrinkWrap: true,
                      children: [
                        for(int i = 0; i < 20; i++)...<Widget>[
                          leaderBoardItem(i),
                        ],
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight / 8,),
                ],
              ),
            ),
            //Floating user
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(
                bottom: 75 + 6,
                left: screenWidth / 20,
                right: screenWidth / 20,
              ),
              child: gradientContainer2(
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth / 20,
                    vertical: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          userPlaceIndex < 3 ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/leaderboard_screen/place_${userPlaceIndex + 1}.png",
                                height: 33,
                              ),
                            ],
                          ) : Text(
                            "${userPlaceIndex + 1}.",
                            style: const TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 8,),
                          Image.asset(
                            UserVariables.avatarAsset,
                            height: 33,
                          ),
                          const SizedBox(width: 8,),
                          Text(
                            UserVariables.username,
                            style: const TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        NumberFormat('##,000').format(UserVariables.trophy).toString(),
                        style: const TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Color(0xFF00A3FF),
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
    );
  }

  Widget leaderBoardItem(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 55,
          width: 40,
          child: Align(
            alignment: Alignment.centerLeft,
            child: index < 3 ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/leaderboard_screen/place_${index + 1}.png",
                  height: 33,
                ),
              ],
            ) : Text(
              "${index + 1}.",
              style: const TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Image.asset(
          leaderBoardPlayers[index].split(';')[2],
          width: 37,
        ),
        const SizedBox(width: 8,),
        Expanded(
          child: Container(
            height: 40,
            width: screenWidth,
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF0C0E24),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  leaderBoardPlayers[index].split(';')[0],
                  style: const TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                Text(
                  NumberFormat('##,000').format(int.parse(leaderBoardPlayers[index].split(';')[1])).toString(),
                  style: const TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color(0xFF00A3FF),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget gradientContainer(Widget widget) {
    return Container(
      width: screenWidth,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Color(0xFF171B3A),
            ]
        ),
        borderRadius: BorderRadius.circular(10),
        border: GradientBoxBorder(
          width: 2,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF0A4E74),
              const Color(0xFF9F00D7).withOpacity(0),
            ],
          ),
        ),
      ),
      child: widget,
    );
  }

  Widget gradientContainer2(Widget widget) {
    return Container(
      width: screenWidth,
      decoration: BoxDecoration(
        color: const Color(0xFF171B3A),
        borderRadius: BorderRadius.circular(10),
        border: GradientBoxBorder(
          width: 2,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF0A4E74),
              const Color(0xFF9F00D7).withOpacity(0),
            ],
          ),
        ),
      ),
      child: widget,
    );
  }
}
