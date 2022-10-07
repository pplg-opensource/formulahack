import 'package:flutter/material.dart';

class TabInformations extends StatelessWidget {
  const TabInformations({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Basic Informations",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
          ),
          SizedBox(height: 22),
          _informationText("Team Name", "Scuderia Ferrari"),
          SizedBox(height: 16),
          _informationText("Base", "Maranello, Italy"),
          SizedBox(height: 16),
          _informationText("Team Chief", "Enrico Cardile / Enrico Gualtieri"),
          SizedBox(height: 16),
          Row(
            children: [
              SizedBox(width: 163, child: _informationText("Chasis", "F1-75")),
              SizedBox(
                  width: 163, child: _informationText("Power Unit", "Ferrari")),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              SizedBox(
                  width: 119,
                  child: _informationText("Highest Race Finish", "1 (x243)")),
              SizedBox(
                  width: 119, child: _informationText("Pole Positions", "237")),
              SizedBox(
                  width: 90, child: _informationText("Fastest Laps", "257")),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              SizedBox(
                  width: 163,
                  child: _informationText("First team entry", "1950")),
              SizedBox(
                  width: 163,
                  child: _informationText("World Championships", "16")),
            ],
          ),
        ],
      ),
    );
  }

  Widget _informationText(String title, String fill) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Color(0xffA6A6A6),
              fontWeight: FontWeight.w600,
              fontSize: 11),
        ),
        SizedBox(height: 5),
        Text(
          fill,
          style: TextStyle(
              color: Color.fromARGB(255, 237, 237, 237),
              fontWeight: FontWeight.w600,
              fontSize: 16),
        ),
      ],
    );
  }
}
