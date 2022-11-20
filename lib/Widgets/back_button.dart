import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key, required this.customContext}) : super(key: key);

  final BuildContext customContext;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Feedback.forTap(context);
        Navigator.pop(customContext);
      },
      child: Container(
        height: 30,
        width: 30,
        decoration: const BoxDecoration(
          color: Colors.black26,
          shape: BoxShape.circle,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/icon_back_arrow.png",
              width: 12,
            ),
          ],
        ),
      ),
    );
  }
}
