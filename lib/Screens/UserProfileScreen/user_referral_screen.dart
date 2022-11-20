import 'dart:math';

import 'package:casualapp/Model/user_model.dart';
import 'package:casualapp/Screens/UserProfileScreen/user_enter_referral.dart';
import 'package:casualapp/Widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class UserReferralScreen extends StatefulWidget {
  const UserReferralScreen({Key? key}) : super(key: key);

  @override
  State<UserReferralScreen> createState() => _UserReferralScreenState();
}

class _UserReferralScreenState extends State<UserReferralScreen> {
  double screenWidth = 0;
  double screenHeight = 0;

  double containerY = 0;
  double borderRadius = 0;
  double avatarOpacity = 0;

  int userRefferals = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 300), () {
        setState(() {
          containerY = screenHeight / 2.6;
          borderRadius = 50;
        });
        Future.delayed(const Duration(milliseconds: 900), () {
          setState(() {
            userRefferals = UserVariables.userReferrals;
          });
        });
      });
    });

    Future.delayed(const Duration(seconds: 3), () {
      if(mounted) {
        Navigator.of(context).push(
          PageTransition(
            child: const UserEnterReferral(),
            type: PageTransitionType.scale,
            alignment: Alignment.center,
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 500),
          ),
        );
      }
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
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                AnimatedContainer(
                  height: containerY,
                  width: screenWidth,
                  duration: const Duration(milliseconds: 800),
                  onEnd: () {
                    setState(() {
                      avatarOpacity = 1;
                    });
                  },
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(borderRadius),
                      bottomLeft: Radius.circular(borderRadius),
                    ),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF01A0FA),
                        Color(0xFF280195),
                      ],
                    ),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.bottomLeft,
                        padding: EdgeInsets.only(
                          left: screenWidth / 20,
                          right: screenWidth / 3,
                          bottom: screenHeight / 2.6 / 4,
                        ),
                        child: RichText(
                          text: TextSpan(
                            text: "Get ",
                            style: const TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w700,
                              fontSize: 30,
                              color: Colors.white,
                              height: 1.5,
                            ),
                            children: [
                              WidgetSpan(
                                child: Image.asset(
                                  "assets/images/icon_dgn.png",
                                  height: 32,
                                ),
                              ),
                              const TextSpan(
                                text: " 1,000+ DGN for inviting your friends",
                              ),
                            ],
                          ),
                        ),
                      ),
                      AnimatedOpacity(
                        opacity: avatarOpacity,
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.easeInOut,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(50),
                            bottomLeft: Radius.circular(50),
                          ),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                avatars(screenHeight / 2.4 / 2.6, 12, 12),
                                avatars(45, -screenWidth / 20, -screenHeight / 2.6 / 2),
                                avatars(30, -screenWidth / 2.5, -screenHeight / 2.6 / 10),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30,),
                RichText(
                  text: TextSpan(
                    text: "Get ",
                    style: const TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      color: Colors.white,
                    ),
                    children: [
                      WidgetSpan(
                        child: Image.asset(
                          "assets/images/icon_dgn.png",
                          height: 30,
                        ),
                      ),
                      const TextSpan(
                        text: " 5 DGN for each invite",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 35,),
                RichText(
                  text: TextSpan(
                    text: "1 ",
                    style: const TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                    children: [
                      WidgetSpan(
                        child: Image.asset(
                          "assets/images/avatars/avatar${Random().nextInt(13) + 1}.png",
                          height: 32,
                        ),
                        alignment: PlaceholderAlignment.middle,
                      ),
                      const TextSpan(
                        text: "  =  ",
                      ),
                      WidgetSpan(
                        child: Image.asset(
                          "assets/images/icon_dgn.png",
                          height: 32,
                        ),
                        alignment: PlaceholderAlignment.middle,
                      ),
                      const TextSpan(
                        text: " 5 DGN",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 35,),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth / 20,
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "+ Extra team bonus",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Earn extra rewards on referral milestones.",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: Color(0xFF858CA9),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          AnimatedContainer(
                            height: 8,
                            curve: Curves.easeInOut,
                            duration: const Duration(milliseconds: 1500),
                            margin: EdgeInsets.only(
                              left: screenWidth / 20,
                              right: screenWidth / 20,
                              top: 15,
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                stops: const [
                                  0, 0.3, 0.6, 1
                                ],
                                colors: [
                                  userRefferals > 5 ? const Color(0xFFA954FF) : const Color(0xFF22264E),
                                  userRefferals > 15 ? const Color(0xFFA954FF) : const Color(0xFF22264E),
                                  userRefferals > 30 ? const Color(0xFFA954FF) : const Color(0xFF22264E),
                                  userRefferals > 50 ? const Color(0xFFA954FF) : const Color(0xFF22264E),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              stepperCircle(5, 5),
                              stepperCircle(15, 100),
                              stepperCircle(30, 250),
                              stepperCircle(50, 1000),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 30,),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFF4C27E0),
                              Color(0xFF5F03A7),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/icon_invite_friend.png",
                              height: 18,
                            ),
                            const SizedBox(width: 8,),
                            const Text(
                              "Invite Friends",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        width: screenWidth,
                        margin: const EdgeInsets.symmetric(
                          vertical: 30,
                        ),
                        color: const Color(0xFF191C2C),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Your Team",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: screenWidth / 7,
                        ),
                        child: const Text(
                          "Invite your friends, you will see your team growing here",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Color(0xFF858CA9),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 30,),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Your referral code",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: Color(0xFF858CA9),
                          ),
                        ),
                      ),
                      container(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "@${UserVariables.username}",
                              style: const TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            Image.asset(
                              "assets/images/icon_copy.png",
                              color: const Color(0xFFB7C1E8),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: screenHeight / 20,
                        ),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "How It Works",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      helpItem(
                        "assets/images/referral_screen/icon_speaker.png",
                        const Color(0xFFC283FF),
                        "Invite Friends",
                        "Your friends need to use your referral link or code to join your team",
                      ),
                      helpItem(
                        "assets/images/referral_screen/icon_silver.png",
                        const Color(0xFF3C2D64),
                        "Silver = ",
                        "When your friend reaches a silver rank in any game, you both get 3 Tickets",
                      ),
                      helpItem(
                        "assets/images/referral_screen/icon_gold.png",
                        const Color(0xFF143C42),
                        "Gold = ",
                        "When your friend reaches a goldrank in any game, you both get 10 Tickets",
                      ),
                      helpItem(
                        "assets/images/referral_screen/icon_rocket.png",
                        const Color(0xFF1A0D97),
                        "Grow your team",
                        "Every friend on at least silver level counts towards your team bonus",
                      ),
                      const SizedBox(height: 16,),
                      container(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/icon_exclamation_mark.png",
                              color: Colors.white,
                              height: 18,
                            ),
                            const SizedBox(width: 5,),
                            const Text(
                              "Read more",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenHeight / 8,),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //Top Bar
          SafeArea(
            child: Container(
              height: 50,
              width: screenWidth,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(
                horizontal: screenWidth / 24,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomBackButton(
                      customContext: context,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 30,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Your Referrals",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget helpItem(String asset, Color color, String text1, String text2) {
    return Container(
      margin: EdgeInsets.only(
        top: screenWidth / 20,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: screenWidth / 6.2,
            width: screenWidth / 6.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  asset,
                  height: screenWidth / 6.2 / 1.8,
                ),
              ],
            ),
          ),
          const SizedBox(width: 12,),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: text1,
                style: const TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w600,
                  fontSize: 19,
                  color: Colors.white,
                  height: 1.25,
                ),
                children: [
                  text1.contains("Silver") || text1.contains("Gold") ? WidgetSpan(
                    child: Image.asset(
                      "assets/images/icon_dgn.png",
                      height: 20,
                    ),
                  ) : const WidgetSpan(
                    child: SizedBox(),
                  ),
                  TextSpan(
                    text: text1.contains("Silver") ? "3" : (text1.contains("Gold") ? "10" : ""),
                  ),
                  TextSpan(
                    text: "\n$text2",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Color(0xFF858CA9),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget container(Widget child) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: screenWidth / 20,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF22264E),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child
    );
  }

  Widget stepperCircle(int milestone, int reward) {
    return Column(
      children: [
        AnimatedContainer(
          height: 38,
          width: 38,
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 800),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                milestone <= userRefferals ? const Color(0xFFA954FF) : const Color(0xFF22264E),
                milestone <= userRefferals ? const Color(0xFF5F00BF) : const Color(0xFF22264E),
              ],
            ),
          ),
          child: Center(
            child: Text(
              milestone.toString(),
              style: const TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/icon_dgn.png",
              height: 15,
            ),
            Text(
              reward.toString(),
              style: const TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w600,
                fontSize: 13,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget avatars(double size, double offsetX, double offsetY) {
    return Container(
      height: size,
      width: size,
      transform: Matrix4.translationValues(offsetX, offsetY, 0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/avatars/avatar${Random().nextInt(13) + 1}.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

}
