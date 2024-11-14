import 'package:flutter/material.dart';

class ReuseableTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;

  const ReuseableTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          // borderSide: BorderSide.none,
        ),
      ),
      obscureText: isPassword,
    );
  }
}
