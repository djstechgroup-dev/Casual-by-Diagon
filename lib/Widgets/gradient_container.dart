import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class GradientContainerWithGradientFill extends StatelessWidget {
  const GradientContainerWithGradientFill({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF171B3A).withOpacity(0),
              const Color(0xFF171B3A),
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
      child: child,
    );
  }
}
