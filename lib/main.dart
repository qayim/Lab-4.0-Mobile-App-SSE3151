import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal[100],
        appBar: AppBar(
          title:
          Text(
            'Dice roll',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 3.0,
              color: Colors.tealAccent,
              fontFamily: 'PTSans',
            ),
          ),
          backgroundColor: Colors.teal[600],
        ),
        body: Center(child: Column (children: <Widget>[
          DicePage(),
        ]
        ),

        ),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {


  @override
  _DicePageState createState() => _DicePageState();
}

void playSound(){
  final player = AudioCache();
  player.play('dicesound.wav');
}

class _DicePageState extends State<DicePage> {
  final player = AudioCache();
  int leftDice = 1;
  int rightDice = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(child: FlatButton(
            child: Image.asset(
              'assets/dice$leftDice.png',
            ),
            onPressed: () {
              setState(() {
                leftDice = Random().nextInt(6) + 1;
                rightDice = Random().nextInt(6) + 1;
                playSound();
              });
            },
          ),
          ),
          Expanded(child:  FloatingActionButton(
            onPressed: () {
              setState(() {
                leftDice = Random().nextInt(6) + 1;
                rightDice = Random().nextInt(6) + 1;
                player.play('dicesound.wav');
              });
            },
            child: Text('Roll'),
          ),
          ),
         Expanded(child:  FlatButton(
           child: Image.asset(
             'assets/dice$rightDice.png',
           ),
           onPressed: () {
             setState(() {
               leftDice = Random().nextInt(6) + 1;
               rightDice = Random().nextInt(6) + 1;
               player.play('dicesound.wav');

             });
           },
         ),
         ),
        ],
      ),
    );
  }
}
