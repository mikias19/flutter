import 'package:flutter/material.dart';

class ReuseableButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const ReuseableButton(
      {super.key, required this.text, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          padding: EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
