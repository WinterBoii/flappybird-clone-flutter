import 'package:flutter/material.dart';

class FlappyBob extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final bobY;

  FlappyBob({this.bobY});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, bobY),
      child: Image.asset(
        'lib/assets/Bob.png',
        width: 57,
      ),
    );
  }
}
