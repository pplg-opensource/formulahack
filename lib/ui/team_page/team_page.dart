import 'package:flutter/material.dart';
import 'package:formulahack/ui/widgets/team_card.dart';
import 'package:formulahack/common/color_values.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Team",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: ColorValues.primaryColor,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return TeamCard(
              index: index,
              teamName: "Ferrari",
              driver1: "C. Leslerc",
              driver2: "C. Sainz",
              numPts: 124);
        },
      ),
    );
  }
}
