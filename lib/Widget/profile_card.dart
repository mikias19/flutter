import 'package:flutter/material.dart';
import 'package:profile_card/Widget/profile_card.dart';
import "package:profile_card/models/profile.dart";

class ProfileCard extends StatelessWidget {
  final Profile profile;

  ProfileCard({super.key, required this.profile});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                profile.imagePath,
                height: 100,
                width: 100,
                fit: BoxFit.fill,
              ),
            ),
            Text(
              profile.name,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple),
            ),
            Text(
              profile.title,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            Text(
              profile.description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
