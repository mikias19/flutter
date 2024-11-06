import 'dart:math';
import 'package:flutter/material.dart';
import "package:rolldice/Screens/dice_roll_screen.dart";
import "package:rolldice/Widget/dice_face.dart";

class DiceRollerScreen extends StatefulWidget {
  const DiceRollerScreen({super.key});
  @override
  State<DiceRollerScreen> createState() {
    return _DiceRollerScreenState();
  }
}

class _DiceRollerScreenState extends State<DiceRollerScreen> {
  int _diceNumber = 1;

  void _rollDice() {
    setState(() {
      _diceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Dice Roller"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DiceFace(
              number: _diceNumber,
              size: 150,
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  foregroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: _rollDice,
                child: const Text(
                  "Roll the Dice",
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
