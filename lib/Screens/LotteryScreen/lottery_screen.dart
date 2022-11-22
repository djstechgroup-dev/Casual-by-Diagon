import 'package:casualapp/Screens/LotteryScreen/lottery_item.dart';
import 'package:flutter/material.dart';

class LotteryScreen extends StatefulWidget {
  const LotteryScreen({Key? key}) : super(key: key);

  @override
  State<LotteryScreen> createState() => _LotteryScreenState();
}

class _LotteryScreenState extends State<LotteryScreen> {
  double screenWidth = 0;
  double screenHeight = 0;

  int secondsLeft1 = 90000;
  int secondsLeft2 = 65320;

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

    List<Widget> lotteryList = [
      LotteryItem(
        seconds: secondsLeft1,
        asset: "assets/images/lottery_screen/bg_1.png",
        topLeftText1: "WEEKLY DRAW",
        topLeftText2: "\nLOTTERY\nPOOL",
        centerText1: "WIN UP TO",
        centerText2: "\nN100,000",
        centerText3: "\nCollect at least 10,000 tickets to enter the draw",
        buttonText: "Join Raffle Draw",
        buttonColor: const Color(0xFFDE419F),
      ),
      const SizedBox(height: 20,),
      LotteryItem(
        seconds: secondsLeft2,
        asset: "assets/images/lottery_screen/bg_2.png",
        topLeftText1: "LUCKY\nDRAW",
        topLeftText2: "",
        centerText1: "WIN A MOVIE\nTICKET EVERY\nWEEKEND",
        centerText2: "",
        centerText3: "\nCollect at least 5,000 tickets to enter the draw",
        buttonText: "Join to Win Ticket",
        buttonColor: const Color(0xFFFFAD31),
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF020412),
      body: SafeArea(
        child: SingleChildScrollView(
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
                      "Raffle Draw",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                        fontSize: screenWidth / 16,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4,),
                    const Text(
                      "Earn massive cash rewards !!!",
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
              SizedBox(height: screenHeight / 25,),
              Column(
                children: [
                  for(int i = 0; i < lotteryList.length; i++)...<Widget>[
                    AnimatedContainer(
                      duration: Duration(milliseconds: 500 + i * 100),
                      curve: Curves.easeInOut,
                      transform: Matrix4.translationValues(0, startShowing ? 0 : screenHeight, 0),
                      child: lotteryList[i],
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
