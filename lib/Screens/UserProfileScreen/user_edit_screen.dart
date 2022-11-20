import 'package:casualapp/Model/user_model.dart';
import 'package:casualapp/Screens/UserProfileScreen/user_edit_avatar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class UserEditScreen extends StatefulWidget {
  const UserEditScreen({Key? key}) : super(key: key);

  @override
  State<UserEditScreen> createState() => _UserEditScreenState();
}

class _UserEditScreenState extends State<UserEditScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  double screenWidth = 0;
  double screenHeight = 0;

  bool isChanged = false;

  @override
  void initState() {
    super.initState();

    setState(() {
      firstNameController.text = UserVariables.firstName;
      lastNameController.text = UserVariables.lastName;
      usernameController.text = "@${UserVariables.username}".trim();
    });
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
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth / 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight / 12,
                      bottom: screenHeight / 20,
                    ),
                    child: Text(
                      "Edit Profile",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                        fontSize: screenWidth / 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Feedback.forTap(context);
                      Navigator.of(context).push(
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: const UserEditAvatar(),
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        ),
                      ).then((value) {
                        //Refresh image
                        setState(() {});
                      });
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
                            width: screenWidth / 3.5,
                            fit: BoxFit.fill,
                          ) : Image.asset(
                            UserVariables.avatarAsset,
                            width: screenWidth / 3.5,
                            fit: BoxFit.fill,
                          ),
                          Transform.translate(
                            offset: Offset(-(screenWidth / 3.5 / 4 / 2.5), 0),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xFF020412),
                                  width: 3.5,
                                ),
                              ),
                              child: Image.asset(
                                "assets/images/user_profile_screen/icon_edit_profile.png",
                                height: screenWidth / 3.5 / 4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight / 18,),
                  Row(
                    children: [
                      Expanded(
                        child: fieldContainer(firstNameController, "First Name"),
                      ),
                      const SizedBox(width: 12,),
                      Expanded(
                        child: fieldContainer(lastNameController, "Last Name"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12,),
                  fieldContainer(usernameController, "Username"),
                  SizedBox(height: screenHeight / 20,),
                  buttonSave(),
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
              child: GestureDetector(
                onTap: () {
                  Feedback.forTap(context);
                  Navigator.pop(context);
                },
                child: Image.asset(
                  "assets/images/button_back.png",
                  width: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget fieldContainer(TextEditingController controller, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontFamily: "Inter",
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: Color(0xFF5C617A),
          ),
        ),
        const SizedBox(height: 8,),
        Container(
          height: 60,
          width: screenWidth,
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF22264E),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: TextFormField(
              onChanged: (v) {
                setState(() {
                  isChanged = true;
                });
              },
              maxLines: 1,
              controller: controller,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              style: const TextStyle(
                color: Colors.white,
                fontFamily: "Inter",
                fontWeight: FontWeight.w500,
                fontSize: 15,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buttonSave() {
    return GestureDetector(
      onTap: () {
        setState(() {
          UserVariables.firstName = firstNameController.text.trim().replaceAll(RegExp(r' \s+'), ' ');
          UserVariables.lastName = lastNameController.text.trim().replaceAll(RegExp(r' \s+'), ' ');
          UserVariables.username = usernameController.text.replaceAll('@','').toLowerCase().trim();
          isChanged = false;
        });
      },
      child: AnimatedContainer(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 500),
        height: isChanged ? 60 : 0,
        width: screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF4CE5B7),
              Color(0xFF2C48BB),
            ],
          ),
        ),
        child: const Center(
          child: Text(
            "Save Changes",
            style: TextStyle(
              fontFamily: "Inter",
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

}
