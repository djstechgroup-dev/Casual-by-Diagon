import 'package:casualapp/Model/user_model.dart';
import 'package:casualapp/Widgets/gradient_container.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:intl/intl.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  double screenWidth = 0;
  double screenHeight = 0;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF020412),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth / 20,
          ),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight / 15,),
              Container(
                height: screenHeight / 4.2,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage(
                      "assets/images/wallet_screen/img_blur.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                  border: GradientBoxBorder(
                    width: 2,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color (0xFF901F1F),
                        const Color(0xFF450000).withOpacity(0.4),
                      ],
                    ),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.all(
                    screenWidth / 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              "DGN",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w800,
                                fontSize: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            height: screenHeight / 4.2 / 7.5,
                            width: screenHeight / 4.2 / 7.5,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black.withOpacity(0.5),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/icon_info.png",
                                  height: screenHeight / 4.2 / 7.5 / 1.8,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/icon_dgn.png",
                                height: screenHeight / 4.2 / 3,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: "Balance",
                                  style: const TextStyle(
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "\n${NumberFormat('##,000').format(UserVariables.userDGN).toString()}",
                                      style: const TextStyle(
                                        fontFamily: "Inter",
                                        fontWeight: FontWeight.w800,
                                        fontSize: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: screenHeight / 4.2 / 4,
                            width: screenHeight / 4.2 / 4,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Image.asset(
                                "assets/images/wallet_screen/icon_refresh.png",
                                height: screenHeight / 4.2 / 4 / 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Transaction History",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w700,
                    fontSize: screenWidth / 16,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              historyItem(
                "assets/images/icon_present.png",
                const Color(0xFF22264E),
                "Daily Reward",
                "+5", 0,
              ),
              historyItem(
                "assets/images/user_profile_screen/icon_trophy.png",
                const Color(0xFF3700AD),
                "1 Vs 1 challenge",
                "-50", 0,
              ),
              historyItem(
                "assets/images/user_profile_screen/icon_trophy.png",
                const Color(0xFF3700AD),
                "Tournament",
                "+200", 0,
              ),
              historyItem(
                "assets/images/icon_present.png",
                const Color(0xFF22264E),
                "Daily Reward",
                "+5", 0,
              ),
              historyItem(
                "assets/images/icon_invite_friend.png",
                const Color(0xFF048154),
                "Referral Bonus",
                "+500", 1,
              ),
              const SizedBox(height: 12,),
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
              const SizedBox(height: 30,),
              GradientContainerWithGradientFill(
                child: Padding(
                  padding: EdgeInsets.all(
                    screenWidth / 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/icon_dgn.png",
                            height: 31,
                          ),
                          const SizedBox(width: 12,),
                          const Text(
                            "How to Get DGN",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        "assets/images/button_arrow_right.png",
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight / 8,),
            ],
          ),
        ),
      ),
    );
  }

  Widget historyItem(String asset, Color colorBg, String text, String amount, int options) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 12,
            right: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colorBg,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          asset,
                          height: 14,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8,),
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
              ),
              Row(
                children: [
                  Text(
                    amount,
                    style: const TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 4,),
                  Image.asset(
                    "assets/images/icon_${options == 0 ? "ticket" : "dgn"}.png",
                    height: 22,
                  ),
                ],
              ),
            ],
          ),
        ),
        divider(),
      ],
    );
  }

  Widget divider() {
    return Container(
      height: 1,
      width: screenWidth,
      margin: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      color: const Color(0xFF171B3A),
    );
  }

}
