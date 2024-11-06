import 'package:flutter/material.dart';
import "package:profile_card/models/profile.dart";
import "package:profile_card/Widget/profile_card.dart";

class HomeScreen extends StatelessWidget {
  Profile user1 = Profile(
    name: "Mikias Kebede",
    title: "Software enginner",
    imagePath: "assets/a.jpg",
    description:
        "Mikias is fronend developer with capability of flutter and react framework",
  );
  Profile user2 = Profile(
    name: "Elshaday Melaku",
    title: "Software enginner",
    imagePath: "assets/b.jpg",
    description:
        "Elshaday is backend developer with capability of node and  framework",
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Profile Card"),
          backgroundColor: Colors.deepPurple,
        ),
        body: ListView(
          children: [
            ProfileCard(
              profile: user1,
            ),
            ProfileCard(
              profile: user2,
            ),
            ProfileCard(
              profile: user1,
            ),
            ProfileCard(
              profile: user2,
            )
          ],
        ),
      ),
    );
  }
}
