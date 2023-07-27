import 'dart:async';

import 'package:flappy_bird/barrier.dart';
import 'package:flappy_bird/flappybob.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // bob variables
  static double bobY = 0;
  double initialPos = bobY;
  double time = 0;
  double height = 0;
  double gravity = -4.9;
  double velocity = 2.7; // how strong the jump is
  double bobWidth = 0.1; // out of 2, 2 being the entire width of the screen
  double bobHeight = 0.1;

  // game variables
  bool gameIsStarted = false;

  // barrier variables
  static List<double> barrierX = [2, 2 + 1.5];
  static double barrierWidth = 0.5; // out of 2
  List <List<double>> barrierHeight = [
    // out of 2, where 2 is the entire height of the screen
    // topHeight, bottomHeight
    [0.6, 0.4],
    [0.4, 0.6],
  ];


  void jump() {
    setState(() {
      print("jump");
      time = 0;
      initialPos = bobY;
    });
  }

  void startGame() {
    print("startgame");

    gameIsStarted = true;
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      height = gravity * time * time + velocity * time;
      setState(() {
        bobY = initialPos - height;
      });

      print(initialPos);
      print(height);
      if (birdIsDead()) {
        timer.cancel();
        _showDialog();
      }

      time += 0.008;
    });
  }

  void resetGame() {
    Navigator.pop(context); // dismisses the dialog
    setState(() {
      bobY = 0;
      gameIsStarted = false;
      time = 0;
      initialPos = bobY;
    });
  }

  void _showDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.brown,
          title: const Center(
            child: Text(
              "G A M E  O V E R",
              style: TextStyle(color: Colors.white),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: resetGame,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  padding: const EdgeInsets.all(7),
                  color: Colors.white,
                  child: const Text(
                    "PLAY AGAIN",
                    style: TextStyle(color: Colors.brown),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  bool birdIsDead() {
    if (bobY > 1 || bobY < -1) {
      return true;
    }

    // check if bob hit barrier x and y
    for (int i = 0; i < barrierX.length;) {
      if (barrierX[i] <= bobWidth && barrierX[i] + barrierWidth >= -bobWidth &&
      (bobY <= -1 + barrierHeight[i][0]) ||
      bobY +  bobHeight >= 1 - barrierHeight[i][1]) {
        return true;
      }
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gameIsStarted ? jump : startGame,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.blueGrey,
                child: Center(
                  child: Stack(
                    children: [
                      FlappyBob(
                        bobY: bobY,
                        bobHeight: bobHeight,
                        bobWidth: bobWidth,
                      ),
                      Container(
                        alignment: Alignment(0, -0.3),
                        child: gameIsStarted
                        ? const Text('')
                        : const Text(
                          'T A P  T O  P L A Y',
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                      ),
                      MyBarrier(
                        barrierX: barrierX[0],
                        barrierWidth:  barrierWidth,
                        barrierHeight: barrierHeight[0][0],
                        isBottomBarrier: false,
                      ),
                      MyBarrier(
                        barrierX: barrierX[0],
                        barrierWidth:  barrierWidth,
                        barrierHeight: barrierHeight[0][1],
                        isBottomBarrier: true,
                      ),
                      MyBarrier(
                        barrierX: barrierX[1],
                        barrierWidth:  barrierWidth,
                        barrierHeight: barrierHeight[1][0],
                        isBottomBarrier: false,
                      ),
                      MyBarrier(
                        barrierX: barrierX[1],
                        barrierWidth:  barrierWidth,
                        barrierHeight: barrierHeight[1][1],
                        isBottomBarrier: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 20,
              color: Colors.greenAccent,
            ),
            Expanded(
              child: Container(
                color: Colors.brown,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('S C O R E', style: TextStyle(fontSize: 20, color: Colors.white),),
                        SizedBox(height: 20,),
                        Text('0', style: TextStyle(fontSize: 20, color: Colors.white),),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('H I G H S C O R E', style: TextStyle(fontSize: 20, color: Colors.white),),
                        SizedBox(height: 20,),
                        Text('10', style: TextStyle(fontSize: 20, color: Colors.white),),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}