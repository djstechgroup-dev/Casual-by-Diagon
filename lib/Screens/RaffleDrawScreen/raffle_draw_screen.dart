import 'package:flutter/material.dart';

class RaffleDrawScreen extends StatefulWidget {
  const RaffleDrawScreen({Key? key}) : super(key: key);

  @override
  State<RaffleDrawScreen> createState() => _RaffleDrawScreenState();
}

class _RaffleDrawScreenState extends State<RaffleDrawScreen> {
  double screenWidth = 0;
  double screenHeight = 0;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
    );
  }
}
