import 'package:flutter/material.dart';

class MyBarrier extends StatelessWidget {
  final barrierHeight; // proportion of the screenheight
  final barrierWidth; // out of 2, where 2 is the width of the screen
  final barrierX;
  final bool isBottomBarrier;

  const MyBarrier({
    super.key,
    this.barrierHeight,
    this.barrierWidth,
    this.barrierX,
    required this.isBottomBarrier,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment((2 * barrierX + barrierWidth) / (2 - barrierWidth),
        isBottomBarrier ? 1 : -1),
      child: Container(
        color: Colors.green,
        width: MediaQuery.of(context).size.width * barrierWidth / 2,
        height: MediaQuery.of(context).size.height * 3 / 4 * barrierHeight / 2,
      ),
    );
  }
}