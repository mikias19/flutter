import 'package:flutter/material.dart';

class MealSpecificationInfo extends StatelessWidget {
  final IconData icon;
  final String info;

  String get CapitalizeInfo {
    return info[0].toUpperCase() + info.substring(1);
  }

  MealSpecificationInfo({super.key, required this.icon, required this.info});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          CapitalizeInfo,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
