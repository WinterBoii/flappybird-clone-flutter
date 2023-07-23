import 'package:flappy_bird/flappybob.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.lightBlue,
              child: const Center(
                child: Stack(
                  children: [
                    FlappyBob(),
                  ],
                ),
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