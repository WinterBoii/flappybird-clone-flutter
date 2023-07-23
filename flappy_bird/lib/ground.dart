import 'package:flutter/material.dart';

class MyGround extends StatelessWidget {
  const MyGround({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        'lib/assets/ground.png',
      ),
    );
  }
}