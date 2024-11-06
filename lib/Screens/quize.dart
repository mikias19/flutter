import "package:quize/Screens/questions_screens.dart";
import "package:flutter/material.dart";
import "package:quize/Screens/Start_screen.dart";
import "package:flutter/widgets.dart";

class Quize extends StatefulWidget {
  const Quize({super.key});

  @override
  State<Quize> createState() => _QuizeState();
}

class _QuizeState extends State<Quize> {
  var screen = "Start_Screen";
  @override
  // void initState() {
  //   activeScreen = StartScreen(onPressed: startQuize);
  //   super.initState();
  // }

  void startQuize() {
    setState(() {
      // activeScreen = QuestionScreen();
      screen = "Question_Screen";
    });
  }

  Widget build(BuildContext context) {
    var activeScreen = screen == "Start_Screen"
        ? StartScreen(onPressed: startQuize)
        : QuestionScreen();
    return MaterialApp(
      title: ' Simple Dice Roller',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: activeScreen,
    );
  }
}
