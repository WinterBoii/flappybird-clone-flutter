import 'package:flutter/material.dart';

class FlappyBob extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final bobY;
  final double bobHeight; // out of 2, 2 being the entire height
  final double bobWidth;

  FlappyBob({
    this.bobY,
    required this.bobHeight,
    required this.bobWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, (2 * bobY + bobHeight) / (2 - bobHeight)),
      child: Image.asset(
        'lib/assets/Bob.png',
        height: MediaQuery.of(context).size.height * 3 / 4 * bobHeight / 2,
        width: MediaQuery.of(context).size.height * bobWidth / 2,
        fit: BoxFit.fill,
      ),
    );
  }
}
