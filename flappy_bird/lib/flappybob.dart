import 'package:flutter/material.dart';

class FlappyBob extends StatelessWidget {
  const FlappyBob({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: 64,
      child: Image.asset(
        'lib/assets/Bob.png',
      ),
    );
  }
}
