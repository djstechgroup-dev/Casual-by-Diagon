import 'package:casualapp/Model/user_model.dart';
import 'package:casualapp/Widgets/back_button.dart';
import 'package:casualapp/Widgets/gradient_container.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserPastActivity extends StatefulWidget {
  const UserPastActivity({Key? key}) : super(key: key);

  @override
  State<UserPastActivity> createState() => _UserPastActivityState();
}

class _UserPastActivityState extends State<UserPastActivity> {
  double screenWidth = 0;
  double screenHeight = 0;

  bool startShowing = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startShowing = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    List<Widget> pastActivityList = [
      GradientContainerWithGradientFill(
        child: pastActivityRow(
          "game_city_dunk", "City Dunk",
          "23 minutes ago", 150,
        ),
      ),
      GradientContainerWithGradientFill(
        child: pastActivityRow(
          "game_archery", "Archery",
          "2 days ago", 120,
        ),
      ),
      GradientContainerWithGradientFill(
        child: pastActivityRow(
          "game_8_ball_billiard", "Billiard Classic",
          "3 days ago", 100,
        ),
      ),
      GradientContainerWithGradientFill(
        child: pastActivityRow(
          "game_knife_rain", "Knife Rain",
          "4 days ago", 140,
        ),
      ),
      GradientContainerWithGradientFill(
        child: pastActivityRow(
          "game_archery", "Archery",
          "5 days ago", 100,
        ),
      ),
      GradientContainerWithGradientFill(
        child: pastActivityRow(
          "game_totemia", "Cursed Marbles",
          "1 week ago", 200,
        ),
      ),
      GradientContainerWithGradientFill(
        child: pastActivityRow(
          "game_city_dunk", "City Dunk",
          "1 month ago", 170,
        ),
      ),
      GradientContainerWithGradientFill(
        child: pastActivityRow(
          "game_endless_truck", "Endless Truck",
          "2 months ago", 120,
        ),
      ),
      GradientContainerWithGradientFill(
        child: pastActivityRow(
          "game_3d_chess", "3D Chess",
          "2 months ago", 270,
        ),
      ),
      GradientContainerWithGradientFill(
        child: pastActivityRow(
          "game_table_tennis", "Table Tennis",
          "3 months ago", 110,
        ),
      ),
    ];

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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Past Activity",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w700,
                            fontSize: screenWidth / 16,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4,),
                        const Text(
                          "Check your past records and game plays.",
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
                  const SizedBox(height: 30,),
                  Column(
                    children: [
                      for(int i = 0; i < pastActivityList.length; i++)...<Widget>[
                        AnimatedContainer(
                          duration: Duration(milliseconds: 500 + i * 100),
                          curve: Curves.easeInOut,
                          margin: const EdgeInsets.only(bottom: 8),
                          transform: Matrix4.translationValues(0, startShowing ? 0 : screenHeight, 0),
                          child: pastActivityList[i],
                        ),
                      ],
                    ],
                  ),
                  SizedBox(height: screenHeight / 15,),
                ],
              ),
            ),
            topBar(),
          ],
        ),
      ),
    );
  }

  Widget pastActivityRow(String asset, String gameTitle, String helperText, int amount) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/game_home_screen/$asset.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 8,),
              RichText(
                text: TextSpan(
                  text: gameTitle,
                  style: const TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: "\n$helperText",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Color(0xFF858CA9),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: 33,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/icon_ticket.png",
                      width: 14,
                    ),
                    Text(
                      amount.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )
            ),
          ),
        ],
      ),
    );
  }

  Widget topBar() {
    return Container(
      height: 50,
      width: screenWidth,
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth / 24,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: CustomBackButton(
              customContext: context,
            ),
          ),
          Hero(
            tag: 'ticket_dgn',
            child: Container(
              height: 30,
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
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
                            fontSize: 14,
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
                            fontSize: 14,
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
          Hero(
            tag: 'profile_level',
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 6, //Must same as offset x
                ),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    UserVariables.avatarAsset == " " ? Image.asset(
                      "assets/images/signup_screen/icon_person.png",
                      height: 30,
                      fit: BoxFit.fill,
                    ) : Image.asset(
                      UserVariables.avatarAsset,
                      height: 30,
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
                          Text(
                            UserVariables.userLevel.toString(),
                            style: const TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w600,
                              fontSize: 6,
                              color: Colors.white,
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
    );
  }

}
