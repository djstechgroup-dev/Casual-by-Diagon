import 'package:flutter/material.dart';

class LotteryItem extends StatelessWidget {
  const LotteryItem({Key? key, required this.seconds, required this.asset, required this.topLeftText1, required this.topLeftText2, required this.centerText1, required this.centerText2, required this.centerText3, required this.buttonText, required this.buttonColor}) : super(key: key);

  final int seconds;
  final String asset;
  final String topLeftText1;
  final String topLeftText2;
  final String centerText1;
  final String centerText2;
  final String centerText3;
  final String buttonText;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight / 3.4,
      width: screenWidth,
      padding: EdgeInsets.all(
        screenWidth / 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(
            asset,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          RichText(
            text: TextSpan(
              text: topLeftText1,
              style: const TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w600,
                fontSize: 10,
                color: Colors.white,
              ),
              children: [
                TextSpan(
                  text: topLeftText2,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: screenHeight / 3.4 / 8,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(100),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/lottery_screen/icon_timer.png",
                    height: screenHeight / 3.4 / 8 / 2,
                  ),
                  const SizedBox(width: 6,),
                  Text(
                    Duration(seconds: seconds).inDays < 1 ?"${Duration(seconds: seconds).inHours}h ${Duration(seconds: seconds % 3600).inMinutes}m left"
                        : "${Duration(seconds: seconds).inDays + 1} Days left",
                    style: const TextStyle(
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RichText(
                  text: TextSpan(
                    text: centerText1,
                    style: const TextStyle(
                      fontFamily: "Monument",
                      fontWeight: FontWeight.w800,
                      fontSize: 21,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: centerText2,
                        style: const TextStyle(
                          fontSize: 35,
                        ),
                      ),
                      TextSpan(
                        text: centerText3,
                        style: const TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8,),
                Container(
                  height: screenHeight / 3.4 / 4,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      buttonText,
                      style: const TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
