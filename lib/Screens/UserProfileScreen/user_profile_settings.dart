import 'package:casualapp/Model/user_model.dart';
import 'package:casualapp/Screens/UserProfileScreen/user_edit_screen.dart';
import 'package:casualapp/Widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:page_transition/page_transition.dart';

class UserProfileSettings extends StatefulWidget {
  const UserProfileSettings({Key? key}) : super(key: key);

  @override
  State<UserProfileSettings> createState() => _UserProfileSettingsState();
}

class _UserProfileSettingsState extends State<UserProfileSettings> {
  double screenWidth = 0;
  double screenHeight = 0;

  bool notification = false;
  bool sound = false;

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
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth / 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight / 12,
                      bottom: screenHeight / 20,
                    ),
                    child: Text(
                      "Profile Settings",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                        fontSize: screenWidth / 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Text(
                    "General",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12,),
                  gradientContainer(
                    generalItemWidget(
                      generalItemRow(
                        33, UserVariables.avatarAsset != " " ? UserVariables.avatarAsset : "assets/images/signup_screen/icon_person.png",
                        "Name & Avatar",
                      ),
                      GestureDetector(
                        onTap: () {
                          Feedback.forTap(context);
                          Navigator.of(context).push(
                            PageTransition(
                              child: const UserEditScreen(),
                              type: PageTransitionType.rightToLeft,
                              curve: Curves.easeInOut,
                              duration: const Duration(milliseconds: 500),
                            ),
                          ).then((value) {
                            //Refresh image
                            setState(() {});
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xFF43B8FA),
                                Color(0xFF434AFA),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 20,
                            ),
                            child: Center(
                              child: Text(
                                "Edit",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  divider(12),
                  gradientContainer(
                    generalItemWidget(
                      generalItemRow(
                        20, "assets/images/user_profile_screen/icon_notifications.png",
                        "Notifications",
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            notification = !notification;
                          });
                        },
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Image.asset(
                              "assets/images/icon_switch_outline.png",
                              width: 50,
                              color: const Color(0xFF4386FA),
                            ),
                            AnimatedContainer(
                              curve: Curves.easeInOut,
                              duration: const Duration(milliseconds: 500),
                              margin: EdgeInsets.only(
                                left: notification ? 27 : 7,
                              ),
                              child: Image.asset(
                                "assets/images/icon_switch_inline.png",
                                width: 16,
                                color: notification ? const Color(0xFF3DB13C) : Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  divider(12),
                  gradientContainer(
                    generalItemWidget(
                      generalItemRow(
                        20, "assets/images/user_profile_screen/icon_game_sounds.png",
                        "Game Sounds",
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            sound = !sound;
                          });
                        },
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            Image.asset(
                              "assets/images/icon_switch_outline.png",
                              width: 50,
                              color: const Color(0xFF4386FA),
                            ),
                            AnimatedContainer(
                              curve: Curves.easeInOut,
                              duration: const Duration(milliseconds: 500),
                              margin: EdgeInsets.only(
                                left: sound ? 27 : 7,
                              ),
                              child: Image.asset(
                                "assets/images/icon_switch_inline.png",
                                width: 16,
                                color: sound ? const Color(0xFF3DB13C) : Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  divider(12),
                  SizedBox(height: screenHeight / 28,),
                  const Text(
                    "Support",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12,),
                  gradientContainerNoFill(
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth / 20,
                      ),
                      child: Column(
                        children: [
                          supportRowItem("icon_about", "About Diagon"),
                          divider(0),
                          supportRowItem("icon_help_support", "Help & Support"),
                          divider(0),
                          supportRowItem("icon_report", "Reported Issues"),
                          divider(0),
                          supportRowItem("icon_privacy_policy", "Privacy Policy"),
                          divider(0),
                          supportRowItem("icon_tc", "Terms & Conditions"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight / 20,),
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/icon_log_out.png",
                          height: 20,
                        ),
                        const SizedBox(width: 8,),
                        const Text(
                          "Sign Out",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/user_profile_screen/icon_trash_bin.png",
                          height: 20,
                        ),
                        const SizedBox(width: 8,),
                        const Text(
                          "Delete Account",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight / 20,),
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
              child: CustomBackButton(
                customContext: context,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget supportRowItem(String asset, String text) {
    return SizedBox(
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 30,
                child: Image.asset(
                  "assets/images/user_profile_screen/$asset.png",
                ),
              ),
              const SizedBox(width: 10,),
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
          ),
          Image.asset(
            "assets/images/button_arrow_right.png",
            width: 18,
          ),
        ],
      ),
    );
  }

  Widget divider(double vertical) {
    return Container(
      height: 1,
      width: screenWidth,
      margin: EdgeInsets.symmetric(
        vertical: vertical,
      ),
      color: vertical != 12 ? const Color(0xFF171B3A) : const Color(0xFF191C2C),
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

  Widget generalItemWidget(Widget leftSideItem, Widget rightSideItem) {
    return Padding(
      padding: EdgeInsets.all(screenWidth / 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          leftSideItem,
          rightSideItem,
        ],
      ),
    );
  }

  Widget generalItemRow(double size, String asset, String text) {
    return Row(
      children: [
        SizedBox(
          width: 33,
          height: 33,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                asset,
                fit: BoxFit.fitWidth,
                height: size,
                width: size,
              ),
            ],
          ),
        ),
        const SizedBox(width: 12,),
        Text(
          text,
          style: const TextStyle(
            fontFamily: "Inter",
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

}
