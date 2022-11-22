import 'package:casualapp/Model/user_model.dart';
import 'package:casualapp/Widgets/back_button.dart';
import 'package:casualapp/Widgets/choose_avatar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserEditAvatar extends StatefulWidget {
  const UserEditAvatar({Key? key}) : super(key: key);

  @override
  State<UserEditAvatar> createState() => _UserEditAvatarState();
}

class _UserEditAvatarState extends State<UserEditAvatar> {
  double screenWidth = 0;
  double screenHeight = 0;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 50,
              ),
              child: ChooseAvatar(),
            ),
            topBar(),
          ],
        ),
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
