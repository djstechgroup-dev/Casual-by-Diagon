import 'package:casualapp/Model/user_model.dart';
import 'package:flutter/material.dart';

class ChooseAvatar extends StatefulWidget {
  const ChooseAvatar({Key? key}) : super(key: key);

  @override
  State<ChooseAvatar> createState() => _ChooseAvatarState();
}

class _ChooseAvatarState extends State<ChooseAvatar> {
  List<String> avatarAsset = [
    'icon_camera_select',
    'avatar1',
    'avatar2',
    'avatar3',
    'avatar4',
    'avatar5',
    'avatar6',
    'avatar7',
    'avatar8',
    'avatar9',
    'avatar10',
    'avatar11',
    'avatar12',
    'avatar13',
    'avatar14',
  ];

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

    return Scaffold(
      backgroundColor: const Color(0xFF020412),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                transform: Matrix4.translationValues(startShowing ? 0 : screenWidth, 0, 0),
                padding: EdgeInsets.symmetric(
                  vertical: screenWidth / 12,
                ),
                child: Text(
                  "Choose Avatar",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w700,
                    fontSize: screenWidth / 16,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                height: screenHeight,
                width: screenWidth,
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth / 16,
                ),
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: screenWidth / 20,
                  mainAxisSpacing: screenWidth / 20,
                  children: [
                    for(int i = 0; i < avatarAsset.length; i++)...<Widget>[
                      i == 0 ? AnimatedContainer(
                        duration: Duration(milliseconds: 300 + (i * 100)),
                        curve: Curves.easeInOut,
                        height: screenWidth / 3.5,
                        width: screenWidth / 3.5,
                        transform: Matrix4.translationValues(0, startShowing ? 0 : screenHeight, 0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF1B1D32),
                        ),
                        child: Center(
                          child: Image.asset(
                            "assets/images/avatars/icon_camera_select.png",
                            width: (screenWidth / 3.5) / 3,
                          ),
                        ),
                      ) : GestureDetector(
                        onTap: () {
                          Feedback.forTap(context);
                          setState(() {
                            UserVariables.avatarAsset = "assets/images/avatars/avatar$i.png";
                          });
                          Navigator.pop(context);
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300 + (i * 100)),
                          curve: Curves.easeInOut,
                          transform: Matrix4.translationValues(0, startShowing ? 0 : screenHeight, 0),
                          child: Image.asset(
                            "assets/images/avatars/avatar$i.png",
                            width: screenWidth / 3.5,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
