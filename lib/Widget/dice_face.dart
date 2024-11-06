import 'package:flutter/material.dart';

class DiceFace extends StatelessWidget {
  final int number;
  final double size;

  const DiceFace({super.key, required this.number, this.size = 150});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 1,
          )
        ],
      ),
      child: Center(
        child: Text(
          number.toString(),
          style: TextStyle(
            fontSize: size / 2,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
