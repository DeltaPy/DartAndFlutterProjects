import 'package:flutter/material.dart';
import 'package:dice_app/styled_text.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math';

final randomizer = Random();
final player = AudioPlayer();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  int diceValue = randomizer.nextInt(6) + 1;
  void rollDice() {
    player.play(AssetSource('sounds/dice-roll.wav'));
    setState(() {
      diceValue = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$diceValue',
          style: const TextStyle(fontSize: 50, color: Colors.white),
        ),
        Image.asset(
          'assets/images/dice-$diceValue.png',
          width: 200,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: rollDice,
          style: ElevatedButton.styleFrom(
              // padding: EdgeInsets.only(top: 10),
              foregroundColor: Colors.white),
          child: const StyledText("Roll Dice"),
        ),
      ],
    );
  }
}
