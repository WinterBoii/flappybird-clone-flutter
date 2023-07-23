import 'dart:async';

import 'package:flappy_bird/flappybob.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double bobYaxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = bobYaxis;
  bool gameIsStarted = false;

  void jump() {
    setState(() {
      time = 0;
      initialHeight = height;
    });
  }

  void startGame() {
    gameIsStarted = true;
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      time += 0.7;
      height = -4.9 * time * time + 2.8 * time;
      setState(() {
        initialHeight = bobYaxis - height;
      });
      if (bobYaxis > 1) {
        timer.cancel();
        gameIsStarted = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: () {
                if (gameIsStarted) {
                  jump();
                } else {
                  startGame();
                }
              },
              child: AnimatedContainer(
                alignment: Alignment(0, bobYaxis),
                duration: const Duration(milliseconds: 0),
                color: Colors.blueGrey,
                child: const FlappyBob(),
              ),
            ),
          ),
          SizedBox(
            height: 25,
            child: Container(
              color: Colors.greenAccent,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.brown,
            ),
          )
        ],
      ),
    );
  }
}