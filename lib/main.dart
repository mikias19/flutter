import "package:expenses_tracker/screens/home_screen.dart";
import 'package:flutter/material.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 96, 59, 181));
var kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark, seedColor: Color.fromARGB(255, 5, 99, 125));
void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData().copyWith(
          appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: kDarkColorScheme.primary,
              foregroundColor: kDarkColorScheme.onPrimary)),
      theme: ThemeData().copyWith(
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primary,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondary,
        ),
        textTheme: const TextTheme().copyWith(
          titleLarge: TextStyle(fontSize: 15, color: kColorScheme.primary),
        ),
      ),
      home: const HomePage(),
    ),
  );
}
