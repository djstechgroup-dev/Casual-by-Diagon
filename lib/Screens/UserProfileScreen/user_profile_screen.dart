import 'dart:math';
import 'package:casualapp/Model/user_model.dart';
import 'package:casualapp/Screens/UserProfileScreen/user_past_activity.dart';
import 'package:casualapp/Screens/UserProfileScreen/user_profile_settings.dart';
import 'package:casualapp/Screens/UserProfileScreen/user_highscores.dart';
import 'package:casualapp/Screens/UserProfileScreen/user_referral_screen.dart';
import 'package:casualapp/Widgets/back_button.dart';
import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
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
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth / 20,
                vertical: screenHeight / 12,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'profile_level',
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 6, //Must same as offset x
                      ),
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          UserVariables.avatarAsset == " " ? Image.asset(
                            "assets/images/signup_screen/icon_person.png",
                            height: screenHeight / 10,
                            fit: BoxFit.fill,
                          ) : Image.asset(
                            UserVariables.avatarAsset,
                            height: screenHeight / 10,
                            fit: BoxFit.fill,
                          ),
                          Transform.translate(
                            offset: const Offset(-14, 0),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/icon_red_circle_outlined.png",
                                  height: screenHeight / 10 / 3,
                                ),
                                DefaultTextStyle(
                                  style: const TextStyle(
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w600,
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
                  const SizedBox(height: 24,),
                  Text(
                    UserVariables.username !=  " " ? "@${UserVariables.username}" : "@username",
                    style: const TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6,),
                  Text(
                    UserVariables.firstName !=  " " ? "${UserVariables.firstName} ${UserVariables.lastName}" : "First surname",
                    style: const TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30,),
                  gradientContainer(
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth / 20,
                        vertical: screenWidth / 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Ticket Balance",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            height: screenHeight / 7.5 / 2.2,
                            margin: const EdgeInsets.only(
                              top: 8,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF22264E),
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: screenWidth / 20),
                                Image.asset(
                                  "assets/images/icon_ticket.png",
                                  height: screenHeight / 7.5 / 2.2 / 2,
                                ),
                                const SizedBox(width: 4,),
                                Countup(
                                  begin: 0,
                                  end: UserVariables.userTicket.toDouble(),
                                  duration: const Duration(seconds: 1),
                                  separator: ',',
                                  style: const TextStyle(
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12,),
                  gradientContainer(
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth / 20,
                        vertical: screenWidth / 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Level ${UserVariables.userLevel}",
                            style: const TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          divider(Colors.white, 20, 2, 12, 0,),
                          Text(
                            UserVariables.rank,
                            style: const TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          divider(Colors.white, 20, 2, 12, 0,),
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/user_profile_screen/icon_trophy.png",
                              ),
                              Countup(
                                begin: 0,
                                end: UserVariables.trophy.toDouble(),
                                duration: const Duration(seconds: 1),
                                separator: ',',
                                style: const TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30,),
                  GestureDetector(
                    onTap: () {
                      Feedback.forTap(context);
                      Navigator.of(context).push(
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: const UserReferralScreen(),
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                        top: screenWidth / 20,
                        left: screenWidth / 20,
                        right: screenWidth / 4,
                        bottom: screenWidth / 20,
                      ),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF00C64F),
                            Color(0xFF006F39),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Your Referrals",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 4,
                            ),
                            child: RichText(
                              text: TextSpan(
                                text: "For every New Member ",
                                style: const TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w800,
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                                children: [
                                  WidgetSpan(
                                    child: Image.asset(
                                      "assets/images/icon_dgn.png",
                                      width: 30,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: "5 DGN",
                                  ),
                                ],
                              ),
                            ),
                          ),
                          person3Photos(),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12,),
                  GestureDetector(
                    onTap: () {
                      Feedback.forTap(context);
                      Navigator.of(context).push(
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: const UserHighScores(),
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        ),
                      );
                    },
                    child: containerButton(
                      const Color(0xFF5E00BE).withOpacity(0.2),
                      rowButtonContent("icon_highscore", "Your Highscores"),
                    ),
                  ),
                  const SizedBox(height: 12,),
                  GestureDetector(
                    onTap: () {
                      Feedback.forTap(context);
                      Navigator.of(context).push(
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: const UserPastActivity(),
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        ),
                      );
                    },
                    child: containerButton(
                      const Color(0xFF00A610).withOpacity(0.2),
                      rowButtonContent("icon_past_activity", "Past Activity"),
                    ),
                  ),
                  const SizedBox(height: 12,),
                  GestureDetector(
                    onTap: () {
                      Feedback.forTap(context);
                      Navigator.of(context).push(
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: const UserReferralScreen(),
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        ),
                      );
                    },
                    child: containerButton(
                      const Color(0xFF171B3A),
                      rowButtonContent("icon_referral", "Referral Code"),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Community",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  gradientContainerNoFill(
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth / 20,
                        vertical: screenWidth / 16,
                      ),
                      child: Column(
                        children: [
                          communityItem("icon_discord", "Discord"),
                          divider(const Color(0xFF191C2C), 1, screenWidth, 0, 12,),
                          communityItem("icon_telegram", "Telegram Group Hangout"),
                          divider(const Color(0xFF191C2C), 1, screenWidth, 0, 12,),
                          communityItem("icon_twitter", "Twitter Social"),
                          divider(const Color(0xFF191C2C), 1, screenWidth, 0, 12,),
                          communityItem("icon_instagram", "Instagram Page"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              width: screenWidth,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(
                horizontal: screenWidth / 24,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBackButton(
                    customContext: context,
                  ),
                  GestureDetector(
                    onTap: () {
                      Feedback.forTap(context);
                      Navigator.of(context).push(
                        PageTransition(
                          child: const UserProfileSettings(),
                          type: PageTransitionType.rightToLeft,
                          curve: Curves.easeInOut,
                          duration: const Duration(milliseconds: 500),
                        ),
                      ).then((value) {
                        setState(() {});
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        right: 6,
                      ),
                      child: Image.asset(
                        "assets/images/icon_cog.png",
                        width: 24,
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

  Widget containerButton(Color color, Widget child) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF171B3A),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth / 20,
            vertical: screenWidth / 20,
          ),
          child: Opacity(
            opacity: 0,
            child: child,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth / 20,
            vertical: screenWidth / 20,
          ),
          child: child,
        ),
      ],
    );
  }

  Widget rowButtonContent(String asset, String text) {
    return Row(
      children: [
        Image.asset(
          "assets/images/user_profile_screen/$asset.png",
          height: 19,
        ),
        const SizedBox(width: 12,),
        Text(
          text,
          style: const TextStyle(
            fontFamily: "Inter",
            fontWeight: FontWeight.w500,
            fontSize: 13,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget person3Photos() {
    return SizedBox(
      width: 72,
      child: Stack(
        alignment: Alignment.center,
        children: [
          photoPerson(22),
          photoPerson(0),
          photoPerson(-22),
        ],
      ),
    );
  }

  Widget photoPerson(double offsetX) {
    return Container(
      height: 28,
      width: 28,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: const Color(0xFF00C64F),
        border: Border.all(
          color: const Color(0xFF00C64F),
          width: 1.5,
        ),
        shape: BoxShape.circle,
      ),
      transform: Matrix4.translationValues(offsetX, 0, 0),
      child: Image.asset(
        "assets/images/avatars/avatar${Random().nextInt(13) + 1}.png",
      ),
    );
  }
  
  Widget communityItem(String asset, String text) {
    return Row(
      children: [
        Container(
          width: 22,
          margin: const EdgeInsets.only(
            right: 12,
          ),
          child: Image.asset(
            "assets/images/user_profile_screen/$asset.png",
            height: 22,
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            fontFamily: "Inter",
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget divider(Color color, double height, double width, double horizontal, double vertical) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.symmetric(
        horizontal: horizontal,
        vertical: vertical,
      ),
      color: color == Colors.white ? Colors.white.withOpacity(0.3) : color,
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

  Widget gradientContainerNoFill(Widget child) {
    return Container(
      width: screenWidth,
      decoration: BoxDecoration(
        border: GradientBoxBorder(
          width: 2,
          gradient: LinearGradient(
            colors: [
              const Color(0xFF0A4E74),
              const Color(0xFF9F00D7).withOpacity(0.31),
            ],
          ),
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }

}
